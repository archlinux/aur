# Maintainer: Ernestas Damanskis <ernestasdamanskis@gmail.com>
# Contributor: Ernestas Damanskis <ernestasdamanskis@gmail.com>
pkgname=walchiev
pkgver=19.77cb156
pkgrel=1
pkgdesc="Perfected steam games icon wallpaper generator."
arch=('any')
url="https://github.com/pog102/walchiev"
license=('MIT')
depends=('imagemagick')
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

