# Maintainer: zlicdt/xkicdt1@gmail.com

pkgname=bilibili-live-danmaku-cli-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="A CLI tool for monitoring danmaku and other live messages on Bilibili Live (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Isoheptane/bilibili-live-danmaku-cli"
license=('MIT')
provides=('bilibili-live-danmaku-cli')
conflicts=('bilibili-live-danmaku-cli')
options=('!strip')

_binname='bilibili-live-danmaku-cli'
asset="bilibili-live-danmaku-cli-${pkgver}.x86_64_linux-musl"

source=(
  "${asset}::https://github.com/Isoheptane/bilibili-live-danmaku-cli/releases/download/${pkgver}/${asset}"
  "source-${pkgver}.tar.gz::https://github.com/Isoheptane/bilibili-live-danmaku-cli/archive/refs/tags/${pkgver}.tar.gz"
)

sha256sums=('647adf650d73d216b3eabaa74da05a27fc20df22420dc6f68444cb87d376cd7f'
            '27ac86da918163a15df47a7923ccba011704231eee3ad9045500b0a3cb0537f0')

package() {
  cd "$srcdir"
  install -Dm755 "${asset}" "$pkgdir/usr/bin/${_binname}"
  install -Dm644 "bilibili-live-danmaku-cli-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


