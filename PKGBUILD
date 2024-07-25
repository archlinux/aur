# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=luajit-tiktoken-bin
pkgver=0.2.1
pkgrel=2
pkgdesc="binding of rust tiktoken to lua"
arch=('x86_64')
url="https://github.com/gptlang/lua-tiktoken"
license=('MIT')
provides=("luajit-tiktoken")
depends=('gcc-libs' 'glibc')
conflicts=('lua51-tiktoken-bin')
source=("https://github.com/gptlang/lua-tiktoken/releases/download/$pkgver/tiktoken_core-linux-luajit.so" "LICENSE")
sha256sums=(
  '3143b29460a5664a79c453e5013dbff9a7527bbe5d083709721a49250f8e6e40'
  '1ac0b128d03630fb038ba682b20aad61ec17bb69b0f0e4cddfcdd8e57635485f')

package() {
  install -Dm755 "tiktoken_core-linux-luajit.so" "$pkgdir/usr/lib/lua/5.1/tiktoken_core.so"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
