# Maintainer: mrdotx <klassiker@gmx.de>
pkgname=rustymeter
pkgver=0.4.2
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
b2sums_x86_64=('3fbf5dbe40388aa9b5c4af436010295b8f6afcf571cf7cf227aedd84a375f4e199d4eadd3a9dbc5c230621a7a5b69cb37fa104d5b5cdca898cd5acaf4f8e1018'
               '5b721e6d68aa982f14fcadbd2ce303be60d2a172075181e8aecb5991d6407555584c5ec527357aab0fcd0bdb1b503199f5e35d3049fd876520758a09dce9e640'
               '115bd531bf8d9560c4c43d398fa0067ea0450a91cb8fbdb9a078dbedcc761cff586e6bd36b83e6aa5eb85e62349d58651271dacff59f4504241645930ddfbb99')

package() {
  cd "$srcdir/"

  install -Dm755 $pkgname-$pkgver "$pkgdir/usr/bin/$pkgname"
  install -Dm644 rustymeter.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 chart-line-solid.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
