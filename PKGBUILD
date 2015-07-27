# Maintainer: mojangsta <steamco/id/mojangsta>
pkgname=pipexec-git
pkgver=2.5.4.g5e524f3
pkgrel=1
pkgdesc="Handling pipe of commands like a single command"
arch=('any')
url="http://github.com/flonatel/pipexec"
license=('GPL2')
depends=()
makedepends=('git')
provides=('pipexec')
source=(git://github.com/flonatel/pipexec.git)
md5sums=(SKIP)
_pkgname=pipexec

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/-.*-/-/' | sed 's/-/./'
}

build() {
  cd "$_pkgname"
  ./build/init_autotools.sh
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}

