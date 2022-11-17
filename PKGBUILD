# Maintainer: pro_shunsuke <shunsuke0901@gmail.com>

pkgname=colmsg
pkgver=3.0.1
pkgrel=1
pkgdesc='A CLI tool for 櫻坂46メッセージ, 日向坂46メッセージ and 乃木坂46メッセージ app.'
arch=(x86_64)
url='https://github.com/proshunsuke/colmsg'
license=(MIT)
makedepends=(clang cmake git rust)
depends=('gcc-libs' 'openssl')
source=("git+$url#commit=859b3f30b46e932a0f39b82bbc05c3d7fdc84c1b") # tag: v3.0.1
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
