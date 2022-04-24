# Maintainer: Václav Šmejkal <business.engo150@gmail.com>

pkgname=annoyingmarkdown-git
pkgver=v.r33.972f69d
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

	printf "v.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd AnnoyingMarkdown

	chmod +x build.sh
	./build.sh install

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
