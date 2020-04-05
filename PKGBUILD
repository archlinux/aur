# Maintainer: pro_shunsuke <shunsuke0901@gmail.com>

pkgname=colmsg
pkgver=0.1.0
pkgrel=1
pkgdesc='A CLI tool for 欅坂/日向坂メッセージアプリ'
arch=(x86_64)
url='https://github.com/proshunsuke/colmsg'
license=(MIT)
makedepends=(clang cmake git rust)
depends=(libssh2)
source=("git+$url#commit=22689cb0bc06bc1cb07188d015d395b9d31287da") # tag: v0.1.0
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
