# Maintainer: mrdotx <klassiker@gmx.de>
pkgname=rustymeter
pkgver=0.4.1
pkgrel=1
pkgdesc='A rust-based egui application to operate your OWON XDM multimeters from your PC without the need for NI VISA'
url='https://github.com/markusdd/rusty_meter'
arch=('x86_64')
license=('MIT')
optdepends=('polkit: to use the rustymeter.desktop shortcut')
provides=('rustymeter')
conflicts=('rustymeter')
source_x86_64=(
    "$pkgname-$pkgver::$url/releases/download/v$pkgver/rusty_meter-x86_64-unknown-linux-gnu"
    'rustymeter.desktop'
    'chart-line-solid.svg'
)
b2sums_x86_64=('6bff2b462c76bef4fede3543220874ca8a6e75ff6f34c2ed361cf3183ca04009080ff29239502cca1e21bbbcfcfd814bbe3aa9002a07c2a85713b3913984e1c5'
               '5b721e6d68aa982f14fcadbd2ce303be60d2a172075181e8aecb5991d6407555584c5ec527357aab0fcd0bdb1b503199f5e35d3049fd876520758a09dce9e640'
               '115bd531bf8d9560c4c43d398fa0067ea0450a91cb8fbdb9a078dbedcc761cff586e6bd36b83e6aa5eb85e62349d58651271dacff59f4504241645930ddfbb99')

package() {
  cd "$srcdir/"

  install -Dm755 $pkgname-$pkgver "$pkgdir/usr/bin/$pkgname"
  install -Dm644 rustymeter.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 chart-line-solid.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
