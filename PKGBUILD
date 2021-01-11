# Maintainer: Triangulum Labs <triangulumlabs@gmail.com>
# Contributor: FrozenCow <frozencow@gmail.com>

pkgname=libusrsctp-git
pkgver=0.9.4.0
pkgrel=1
pkgdesc="A portable SCTP userland stack"

arch=('i686' 'x86_64')
url="https://github.com/sctplab/usrsctp"
license=("BSD")

makedepends=('cmake' 'git')
source=("${pkgver}::https://github.com/sctplab/usrsctp/archive/0.9.4.0.tar.gz")
sha256sums=('e7b8f908d71dc69c9a2bf55d609e8fdbb2fa7cc647f8b23a837d36a05c59cd77')

build() {
  cd "$srcdir/usrsctp-$pkgver"
  unset CPPFLAGS
  cmake .
  make
}

package() {
  cd "$srcdir/usrsctp-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
