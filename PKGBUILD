# Maintainer: Luca D'Amico <damico.luca91@live.it>
pkgname=malcat-lite
pkgver=0.9.3
pkgrel=2
pkgdesc="Malcat is a feature-rich hexadecimal editor / disassembler for Windows and Linux targeted to IT-security professionals."
arch=('x86_64')
url="https://malcat.fr"
license=('Custom')
depends=('gtk3' 'python310' 'python-pycryptodomex' 'python-pyasn1' 'python-pyasn1-modules' 'python-ruamel-yaml'
         'python-ruamel.yaml.clib' 'python-six' 'python-requests' 'python-dissect.cstruct' 'python-tabulate')
source=("https://malcat.fr/latest/malcat_ubuntu22_lite.zip"
        "malcat-lite.desktop")
sha256sums=('7c4549c1aa9d9dc966887e11d640201fe8dc964f988d83ece3522846e27d8c99'
            '823099b512653d9e1aa3d09be42f0ce737248cab29ea8dd3bb2a3c4916922a04')

package() {
    mkdir -p $pkgdir/opt/$pkgname $pkgdir/usr/bin/ $pkgdir/usr/share/applications/
    cp -R $srcdir/* $pkgdir/opt/$pkgname
    install -Dm 644 $pkgdir/opt/$pkgname/static/icone.png $pkgdir/usr/share/pixmaps/$pkgname.png
    install -Dm 644 $startdir/$pkgname.desktop $pkgdir/usr/share/applications/
    ln -s /opt/$pkgname/bin/malcat $pkgdir/usr/bin/malcat
} 
