# Maintainer: pro_shunsuke <shunsuke0901@gmail.com>

pkgname=colmsg
pkgver=3.1.0
pkgrel=1
pkgdesc='A CLI tool for 櫻坂46メッセージ, 日向坂46メッセージ, 乃木坂46メッセージ and 齋藤飛鳥メッセージ app.'
arch=(x86_64)
url='https://github.com/proshunsuke/colmsg'
license=(MIT)
makedepends=(clang cmake git rust)
depends=('gcc-libs' 'openssl')
source=("git+$url#commit=9fc56923dfd5feb68ac0f2e184a10275e8998869") # tag: v3.1.0
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
