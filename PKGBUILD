# Maintainer:  twa022 <twa022 at gmail dot com>

pkgname=geany-nord-theme
pkgver=r15+96f85bd
pkgrel=1
pkgdesc='Nord color theme for Geany.'
arch=('any')
url='https://github.com/Betelgeuse1/NordThemeGeany'
license=('GPL')
depends=('geany')
makedepends=('git')
_commit='96f85bd25ce3be58df186bb44f27ddc9d4387e8c'
source=("${pkgname}::git+https://github.com/Betelgeuse1/NordThemeGeany#commit=${_commit}")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}"/${pkgname}
	printf "r%s+%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
	
package() {
	install -Dm644 ${pkgname}/styling/nord.conf "${pkgdir}"/usr/share/geany/colorschemes/nord.conf
}
