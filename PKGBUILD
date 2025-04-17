# Maintainer: Tanay Pant <tanay1337@gmail.com>
pkgname=taskman-git
pkgver=r3.g180effc
pkgrel=1
pkgdesc="An extremely minimalist to-do list for the CLI."
arch=('any')
url="https://github.com/tanay1337/taskman"
license=('MIT')
depends=('gum')
makedepends=('git')
provides=("taskman")
conflicts=("taskman")
source=('git+https://github.com/tanay1337/taskman.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/taskman"
	echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/taskman"
  install -Dm755 taskman "$pkgdir/usr/bin/taskman"
}
