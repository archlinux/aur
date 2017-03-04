# Maintainer: John W. Trengrove <john@retrofilter.com>

pkgname=stagit
pkgver=0.5
pkgrel=1
pkgdesc="static git page generator"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://git.2f30.org/stagit"
license=('MIT')
source=("http://dl.2f30.org/releases/stagit-${pkgver}.tar.gz")
depends=('libgit2')
makedepends=('git')
sha256sums=('a648f52ef8b0921dfea87a5c6aadcb2bba5b5ea801e2511e83437c613f6fa17a')

build() {
  cd stagit-${pkgver}
  make
}

package() {
  cd stagit-${pkgver}
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
