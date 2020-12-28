# Maintainer: pro_shunsuke <shunsuke0901@gmail.com>

pkgname=colmsg
pkgver=2.0.2
pkgrel=1
pkgdesc='A CLI tool for 櫻坂46メッセージ and 日向坂46メッセージ app.'
arch=(x86_64)
url='https://github.com/proshunsuke/colmsg'
license=(MIT)
makedepends=(clang cmake git rust)
depends=(libssh2)
source=("git+$url#commit=23db2b3fa43de56813d6786c8b247df03f25eed1") # tag: v2.0.2
sha256sums=('SKIP')

build() {
  cd $pkgname
  cargo build --release
}

package() {
  cd $pkgname

  # Package the executable
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"

  # Package the license files
  install -Dm644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
