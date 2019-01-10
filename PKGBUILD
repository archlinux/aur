# Maintainer: Alad Wenter <alad@mailbox.org>
# Contributor: Tomáš Mládek <tmladek @ inventati doth ork>
# Contributor: shuall <shualloret @ gmail . com>

pkgname=chaiscript
pkgver=6.1.0
pkgrel=1
pkgdesc="embedded scripting language which targets C++"
arch=('x86_64')
url="http://www.chaiscript.com"
license=('BSD')
depends=('readline')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Chaiscript/Chaiscript/archive/v$pkgver.tar.gz")
sha256sums=('3ca9ba6434b4f0123b5ab56433e3383b01244d9666c85c06cc116d7c41e8f92a')

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
