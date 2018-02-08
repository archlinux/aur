# Maintainer: Alad Wenter <alad@mailbox.org>
# Contributor: Tomáš Mládek <tmladek @ inventati doth ork>
# Contributor: shuall <shualloret @ gmail . com>

pkgname=chaiscript
pkgver=6.0.0
pkgrel=1
pkgdesc="embedded scripting language which targets C++"
arch=('x86_64')
url="http://www.chaiscript.com"
license=('BSD')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Chaiscript/Chaiscript/archive/v$pkgver.tar.gz")
sha256sums=('ec4b51e30afbc5133675662882c59417a36aa607556ede7ca4736fab2b28c026')

build() {
  cd "ChaiScript-$pkgver"

  cmake -DCMAKE_INSTALL_PREFIX=/usr ./
  make
}

package() {
  cd "ChaiScript-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
