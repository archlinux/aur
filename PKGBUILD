# Maintainer: Václav Šmejkal <business.engo150@gmail.com>

pkgname='WHY2'
pkgver='r1491.d3aa932'
pkgrel=1
epoch=
pkgdesc="Symmetric Encryption System Written in C."
arch=(x86_64)
url="https://gitea.coquette.baby/ENGO150/WHY2"
license=('GPLv3')
groups=()
depends=('git', 'make', 'tmux', 'curl', 'json-c', 'libgit2', 'gmp', 'openssl')
makedepends=('sudo')
checkdepends=()
optdepends=()
provides=('why2')
conflicts=('why2')
replaces=()
backup=()
options=()
install=
changelog=
source=("why2-development::git//github.com/ENGO150/WHY2.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$pkgname"
	git checkout development

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	git checkout development

	make install

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
