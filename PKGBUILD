# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Marcus Behrendt <marcus dot behrendt dot eightysix(in numbers) at bigbrothergoogle dot com
# Contributor: FadeMind <fademind@gmail.com>
pkgname=papirus-libreoffice-theme-git
pkgver=20170228.r8.gcfe7659
pkgrel=1
pkgdesc="Papirus theme for LibreOffice"
url="https://github.com/PapirusDevelopmentTeam/papirus-libreoffice-theme"
arch=('any')
license=('GPL')
depends=('libreoffice')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
