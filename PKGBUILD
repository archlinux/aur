# Maintainer: mrdotx <klassiker@gmx.de>
pkgname=rustymeter
pkgver=0.4.0
pkgrel=2
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
b2sums_x86_64=('3baf2b150dc93cceeb88a8a90b6eec3e0f2f22faba133f0ae242df47dbe0b779bbd549a2dc41c10d61b9d72cb799aa7c1a4b19875f7dfff5975889b0a822a4fe'
               'a58c403d66037baa4ed8736669e83083086591fbf411c2d36cc3251df7180d52463a048f7216cc3fc69d88d66f83744fdeb5d83b778e61ac803cd031b1651ba7'
               '115bd531bf8d9560c4c43d398fa0067ea0450a91cb8fbdb9a078dbedcc761cff586e6bd36b83e6aa5eb85e62349d58651271dacff59f4504241645930ddfbb99')

package() {
  cd "$srcdir/"

  install -Dm755 $pkgname-$pkgver "$pkgdir/usr/bin/$pkgname"
  install -Dm644 rustymeter.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 chart-line-solid.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}
