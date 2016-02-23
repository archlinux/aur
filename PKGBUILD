# Maintainer: Rasmus Steinke <rasi at xssn dot at>

pkgname=rofi-surfraw-git
pkgver=44.e59c541
pkgrel=1
pkgdesc="Universal tool to search the internet"
arch=('any')
url='https://github.com/carnager/rofi-scripts'
license=('GPL')
depends=('rofi-git' 'surfraw')

install=rofi-surfraw.install
makedepends=('git')
source=('git+http://github.com/carnager/rofi-scripts')

pkgver() {
	cd rofi-scripts
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd rofi-scripts/rofi-surfraw
    make DESTDIR="$pkgdir/" \
       PREFIX='/usr' \
       install
}
md5sums=('SKIP')
