# Maintainer: Luca D'Amico <damico.luca91[at]live.it>

pkgname=malcat-lite
pkgver=0.9.6
pkgrel=1
pkgdesc="Malcat is a feature-rich hexadecimal editor / disassembler for Windows and Linux targeted to IT-security professionals."
arch=('x86_64')
url="https://malcat.fr"
license=('Custom')
depends=('gtk3' 'python311' 'python-pycryptodomex' 'python-pyasn1' 'python-pyasn1-modules' 'python-ruamel-yaml'
         'python-ruamel.yaml.clib' 'python-six' 'python-acefile' 'python-requests' 'python-dissect.cstruct' 'python-tabulate')
source=("https://malcat.fr/all/$pkgver/malcat_ubuntu23_lite-$pkgver.zip"
        "malcat-lite.desktop")
sha256sums=('3ccec457e2b0c21da20b1f61e8adf7a29aa704b16e77af9282c6df68d217b077'
            '823099b512653d9e1aa3d09be42f0ce737248cab29ea8dd3bb2a3c4916922a04')

package() {
    mkdir -p $pkgdir/opt/$pkgname $pkgdir/usr/bin/ $pkgdir/usr/share/applications/
    rm $srcdir/malcat_ubuntu23_lite-$pkgver.zip $srcdir/malcat-lite.desktop
    cp -R $srcdir/* $pkgdir/opt/$pkgname
    install -Dm 644 $pkgdir/opt/$pkgname/static/icone.png $pkgdir/usr/share/pixmaps/$pkgname.png
    install -Dm 644 $startdir/$pkgname.desktop $pkgdir/usr/share/applications/
    ln -s /opt/$pkgname/bin/malcat $pkgdir/usr/bin/malcat
} 
