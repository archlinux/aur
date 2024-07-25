# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=lua51-tiktoken-bin
pkgver=0.2.1
pkgrel=4
pkgdesc="binding of rust tiktoken to lua"
arch=('x86_64')
url="https://github.com/gptlang/lua-tiktoken"
license=('MIT')
provides=("lua51-tiktoken")
depends=('gcc-libs' 'glibc')
conflicts=('luajit-tiktoken-bin')
source=("https://github.com/gptlang/lua-tiktoken/releases/download/$pkgver/tiktoken_core-linux-lua51.so" "LICENSE")
sha256sums=(
  'c6ec5e0a1901e525e94178fd21fb7d0fcbc000535b0a549c923397016b6bf3fc'
  '1ac0b128d03630fb038ba682b20aad61ec17bb69b0f0e4cddfcdd8e57635485f')

package() {
  install -Dm755 "tiktoken_core-linux-lua51.so" "$pkgdir/usr/lib/lua/5.1/tiktoken_core.so"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
