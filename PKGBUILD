# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>
# Contributor: Vale Cofer-Shabica <vale.cofershabica@gmail.com>

pkgname=urw-classico
pkgver=20220929
pkgrel=1
pkgdesc="URW Classico font from CTAN (for texlive)"
arch=("any")
license=("CUSTOM:alladin")
url="https://www.ctan.org/tex-archive/fonts/urw/classico"
depends=("texlive-core")
source=("http://mirrors.ctan.org/install/fonts/urw/classico.tds.zip"
        "https://mirrors.ctan.org/fonts/urw/classico.zip"
       "$pkgname.maps")
noextract=("classico.tds.zip")
sha256sums=('8c1ec7496603beac4627ccca43b9f7401273e0b4f838a7268a1a3d582f43642b'
            'f05e07d6b3cfdbdee87c9a2940e6687864541c5edccd74a98ddc3b5023287952'
            '48b27e6629fc71b5661325b63b31c95aafc1db7fd2a5f3a5993597d2ece89ff7')

package() {
    install -m755 -d $pkgdir/usr/share/texmf
    bsdtar -poxf $srcdir/classico.tds.zip -C $pkgdir/usr/share/texmf

    install -m755 -d $pkgdir/var/lib/texmf/arch/installedpkgs
    install -m644 $srcdir/$pkgname.maps $pkgdir/var/lib/texmf/arch/installedpkgs

    install -m755 -d $pkgdir/usr/share/texmf-dist/fonts/map/fontname/
    install -m644 $srcdir/classico/map/classico.map $pkgdir/usr/share/texmf-dist/fonts/map/fontname/

    install -m755 -d $pkgdir/usr/share/licenses/$pkgname
    install -Dm644 $srcdir/classico/doc/COPYING.AFPL $pkgdir/usr/share/licenses/$pkgname
}
