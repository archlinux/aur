# Maintainer: Syed Insaf <syedinsaf@proton.me>
# GitHub: https://github.com/syedinsaf/otaripper

pkgname=otaripper-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Ultra-fast partition extractor for Android OTA files (prebuilt binary)"
arch=('x86_64')
url="https://github.com/syedinsaf/otaripper"
license=('Apache-2.0')

provides=('otaripper')
conflicts=('otaripper' 'otaripper-git')

source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/otaripper-$pkgver-linux-x86_64.tar.gz"
)

sha256sums=(
  'bdb507327a48d1a7575305b202f33a0ceca1fd029f7c309f8f9c39574d7c865e'
)

install=otaripper-bin.install

package() {
  cd "$srcdir"

  install -Dm755 otaripper \
    "$pkgdir/usr/bin/otaripper"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/otaripper/LICENSE"

  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/otaripper/README.md"
}
