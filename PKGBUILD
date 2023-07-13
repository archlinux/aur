# Maintainer: Ernestas Damanskis <ernestasdamanskis@gmail.com>
# Contributor: Ernestas Damanskis <ernestasdamanskis@gmail.com>
pkgname=devify
pkgver=29.abe9ffa
pkgrel=1
pkgdesc="Device notification system using udev rules for monitoring connections."
arch=('any')
url="https://github.com/pog102/devify"
license=('MIT')
depends=('libnotify' 'libcanberra')
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
