# Maintainer: Clem Lorteau <spam at lorteau dot fr>
pkgname=prasmoid
_origpkgname=prasmoid
pkgver=0.0.2
pkgrel=1
pkgdesc="The All in One Development Toolkit for KDE Plasmoids. Build, test, and manage your plasmoids with unparalleled ease and efficiency."
arch=("x86_64")
url='https://github.com/PRASSamin/prasmoid'
license=("MIT")
depends=(
	"plasma-sdk"
	"git"
	"qt6-declarative"
)
makedepends=(
	"jq"
)
source=(
	"https://github.com/PRASSamin/prasmoid/archive/refs/tags/v0.0.2.tar.gz"
	"install.patch"
)
sha256sums=(
	"087ef3698d2b36d55dffb67005cd1411de0f140ec5288aa94663f7a7bd9fd9fe"
	"c7c5ad6175548627758108157410dcf18956f690ae89b8f071717f9d8dfd6b9d"
)
package() {
	patch "${_origpkgname}-${pkgver}/install" < install.patch
	cd "${_origpkgname}-${pkgver}" || exit
	echo "1" | ./install
	install -Dm755 prasmoid "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
