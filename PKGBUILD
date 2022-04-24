# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Václav Šmejkal <business.engo150@gmail.com>
pkgname=annoyingmarkdown-git
pkgver=1.0.r33.972f69d
pkgrel=1
epoch=
pkgdesc="Just simple project to piss off Discord users."
arch=(x86_64)
url="https://github.com/ENGO150/AnnoyingMarkdown.git"
license=('MIT')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(annoyingmarkdown)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
	printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd AnnoyingMarkdown
	sh build.sh
}

package() {
	cd AnnoyingMarkdown
	sh install.sh

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
