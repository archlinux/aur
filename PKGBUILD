# Maintainer: John W. Trengrove <john@retrofilter.com>

pkgname=stagit-git
_pkgname=stagit
pkgver=0.3.1.0.g0328079
pkgrel=1
pkgdesc="static git page generator"
arch=('x86_64' 'i686')
url="http://git.2f30.org/stagit"
license=('MIT')
source=("git://git.2f30.org/stagit.git")
depends=('libgit2')
makedepends=('git')
conflicts=('stagit')
provides=('stagit')
md5sums=('SKIP')

pkgver() {
  cd stagit
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd stagit
  make
}

package() {
  cd stagit
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
