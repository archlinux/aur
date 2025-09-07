# Maintainer: pro_shunsuke <shunsuke0901@gmail.com>

pkgname=colmsg
pkgver=3.5.0
pkgrel=1
pkgdesc='A CLI tool for '櫻坂46メッセージ', '日向坂46メッセージ', '乃木坂46メッセージ', '齋藤飛鳥メッセージ', '白石麻衣メッセージ', and 'yodel' app.'
arch=(x86_64)
url='https://github.com/proshunsuke/colmsg'
license=(MIT)
makedepends=(clang cmake git rust)
depends=('gcc-libs' 'openssl')
source=("git+$url#commit=d50f3d2624a03e0beb2335acbd3a38f3174b7d6c") # tag: v3.5.0
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
