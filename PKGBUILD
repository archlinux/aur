# Maintainer: rany <rany2 at riseup dot net>

pkgname=libchan
pkgver=0.0.4
_commit=b6cae887fdfce1f32eb52466ac3aac860c955d8e
pkgrel=2
pkgdesc="Pure C implementation of Go channels."
arch=('any')
url="https://github.com/tylertreat/chan"
license=('Apache License 2.0')
depends=()
makedepends=()
source=("https://github.com/tylertreat/chan/archive/${_commit}.zip")
sha256sums=('f5ff16151c1aead8f5662998fea316aac1d071a968087078724c846b6cb5cbe0')
provides=('libchan')

build () {
  cd chan-$_commit
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  #make -C chan-$_commit check
  :
}

package () {
  cd chan-$_commit
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
