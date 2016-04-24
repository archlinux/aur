# Maintainer: Rasmus Steinke <rasi at xssn dot at>

pkgname=robot-git
pkgver=65.96f9d64
pkgrel=1
pkgdesc="robot - a poor man's bookmarks manager"
arch=('any')
url='https://github.com/carnager/robot'
license=('GPL')
depends=('python2' 'rofi')
makedepends=('git')
source=('git+https://git.53280.de/robot')

pkgver() {
	cd robot
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd robot
    make DESTDIR="$pkgdir/" \
       PREFIX='/usr' \
       install
}

md5sums=('SKIP')
