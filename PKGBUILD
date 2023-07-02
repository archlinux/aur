# Maintainer: Ernestas Damanskis <ernestasdamanskis@gmail.com>
pkgname='rofi-tt'
pkgver=8.bee3118
pkgrel=1
pkgdesc="menu interface for trash taste podcast"
arch=('any')
url="https://github.com/pog102/rofi-tt"
license=('MIT')
depends=('curl' 'rofi' 'mpv')
makedepends=('git')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver()
{
  cd "$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
