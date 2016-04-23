# Maintainer: Rasmus Steinke <rasi at xssn dot at>
# Contributor: Christian Rebischke

pkgname=clerk-git
pkgver=596.d8f6310
pkgrel=1
pkgdesc="clerk - mpd client for rofi"
arch=('any')
url='https://github.com/carnager/clerk'
conflicts=('clerk')
provides=('clerk')
license=('GPL')
depends=('mpc' 'python-mpd2' 'python-notify2' 'rofi-git')
optdepends=('mpd-sima: similar artists mode')
install="clerk-git.install"
makedepends=('git')
source=('git+http://git.53280.de/clerk')

pkgver() {
	cd clerk
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd clerk
    make DESTDIR="$pkgdir/" \
       PREFIX='/usr' \
       install
}

md5sums=('SKIP')
