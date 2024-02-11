# Maintainer: Luca D'Amico <damico.luca91[at]live.it>

pkgname=malcat-lite
pkgver=0.9.5
pkgrel=1
pkgdesc="Malcat is a feature-rich hexadecimal editor / disassembler for Windows and Linux targeted to IT-security professionals."
arch=('x86_64')
url="https://malcat.fr"
license=('Custom')
depends=('gtk3' 'python-pycryptodomex' 'python-pyasn1' 'python-pyasn1-modules' 'python-ruamel-yaml'
         'python-ruamel.yaml.clib' 'python-six' 'python-acefile' 'python-requests' 'python-dissect.cstruct' 'python-tabulate')
source=("https://malcat.fr/all/$pkgver/malcat_ubuntu23_lite-$pkgver.zip"
        "malcat-lite.desktop")
sha256sums=('e9d25faaacfdeb6b52b89aaf0459ff3ff32176dd9fe4ba8df0c65678f3aea25d'
            '823099b512653d9e1aa3d09be42f0ce737248cab29ea8dd3bb2a3c4916922a04')

package() {
    mkdir -p $pkgdir/opt/$pkgname $pkgdir/usr/bin/ $pkgdir/usr/share/applications/
    rm $srcdir/malcat_ubuntu23_lite-$pkgver.zip $srcdir/malcat-lite.desktop
    cp -R $srcdir/* $pkgdir/opt/$pkgname
    install -Dm 644 $pkgdir/opt/$pkgname/static/icone.png $pkgdir/usr/share/pixmaps/$pkgname.png
    install -Dm 644 $startdir/$pkgname.desktop $pkgdir/usr/share/applications/
    ln -s /opt/$pkgname/bin/malcat $pkgdir/usr/bin/malcat
} 
