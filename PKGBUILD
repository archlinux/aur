# Maintainer: Luca D'Amico <damico.luca91[at]live.it>

pkgname=malcat-lite
pkgver=0.9.4
pkgrel=2
pkgdesc="Malcat is a feature-rich hexadecimal editor / disassembler for Windows and Linux targeted to IT-security professionals."
arch=('x86_64')
url="https://malcat.fr"
license=('Custom')
depends=('gtk3' 'python-pycryptodomex' 'python-pyasn1' 'python-pyasn1-modules' 'python-ruamel-yaml'
         'python-ruamel.yaml.clib' 'python-six' 'python-acefile' 'python-requests' 'python-dissect.cstruct' 'python-tabulate')
source=("https://malcat.fr/latest/malcat_ubuntu23_lite.zip"
        "malcat-lite.desktop")
sha256sums=('3651a790c58ba156ac368acbb4cad6d9d02e306ad3355f3b9de4a9d500f84e41'
            '823099b512653d9e1aa3d09be42f0ce737248cab29ea8dd3bb2a3c4916922a04')

package() {
    mkdir -p $pkgdir/opt/$pkgname $pkgdir/usr/bin/ $pkgdir/usr/share/applications/
    rm $srcdir/malcat_ubuntu23_lite.zip $srcdir/malcat-lite.desktop
    cp -R $srcdir/* $pkgdir/opt/$pkgname
    install -Dm 644 $pkgdir/opt/$pkgname/static/icone.png $pkgdir/usr/share/pixmaps/$pkgname.png
    install -Dm 644 $startdir/$pkgname.desktop $pkgdir/usr/share/applications/
    ln -s /opt/$pkgname/bin/malcat $pkgdir/usr/bin/malcat
} 
