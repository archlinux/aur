# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>
# Contributor: Vale Cofer-Shabica <vale.cofershabica@gmail.com>

pkgname=urw-classico
pkgver=1.0
pkgrel=4
pkgdesc="URW Classico font from CTAN (for texlive)"
arch=("any")
license=("CUSTOM:alladin")
url="https://www.ctan.org/tex-archive/fonts/urw/classico"
depends=("texlive-core")
source=("http://mirrors.ctan.org/install/fonts/urw/classico.tds.zip"
	"$pkgname.maps"
        "license")
noextract=("classico.tds.zip")
md5sums=('166eb8e7f2e1ca764b02e00aae5e86fb'
         '9a675e3b5016e8b1a15a228c6caf1fda'
         '7689a58e80bcc8546b76e397b83a572b')

package() {
    install -m755 -d $pkgdir/usr/share/texmf
    bsdtar -poxf $srcdir/classico.tds.zip -C $pkgdir/usr/share/texmf

    install -m755 -d $pkgdir/var/lib/texmf/arch/installedpkgs
    install -m644 $pkgname.maps $pkgdir/var/lib/texmf/arch/installedpkgs
    
    install -m755 -d $pkgdir/usr/share/licenses
    install -Dm644 $srcdir/license $pkgdir/usr/share/licenses/$pkgname
}
