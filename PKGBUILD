# Maintainer: morpheusthewhite <zffromGerace@hotmail.it>

pkgname=spicetify-themes-git
pkgver=r13.5f997e3
pkgrel=1
pkgdesc="A community-driven collection of themes for spicetify"
arch=('any')
url="https://github.com/morpheusthewhite/spicetify-themes"
license=('MIT')
groups=()
depends=('spicetify-cli')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=''
source=('${pkgname}-${pkgver}.tar.gz::https://github.com/morpheusthewhite/spicetify-themes/archive/master.tar.gz')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	mkdir -p "${pkgdir}"/usr/share/spicetify-cli

	cp -R "$srcdir/${pkgname%-git}-master" "${pkgdir}"/usr/share/spicetify-cli/Themes
	rm -r "${pkgdir}"/usr/share/spicetify-cli/Themes/README.md "${pkgdir}"/usr/share/spicetify-cli/Themes/LICENSE
}
