# Maintainer: mrdotx <klassiker@gmx.de>
pkgname=rustymeter
pkgver=0.4.6
pkgrel=1
pkgdesc='A rust-based egui application to operate your OWON XDM multimeters from your PC without the need for NI VISA'
url='https://github.com/markusdd/rusty_meter'
arch=('x86_64')
license=('MIT')
optdepends=('polkit: to use the rustymeter shortcut with root privileges')
provides=('rustymeter')
conflicts=('rustymeter')
source_x86_64=(
    "$pkgname-$pkgver::$url/releases/download/v$pkgver/rusty_meter-x86_64-unknown-linux-gnu"
    'rustymeter.desktop'
    'rustymeter-root.desktop'
    'chart-line-solid.svg'
)
b2sums_x86_64=('2bc6e957e8f88d5fe810a1a36f6f6aa00d8094a564fdb78b424c801f435c5eeee35c5a9a85f1d8030c83675cb214695e3f762f3f28bcb53dd146cf853117e722'
               '41bf28060c16dcc6de8db30efbd3565c7b750bf9c23abbcf37f1b602a38eafaf91e0333666462ab85b522582d76d464af860acd5ea68722bda06e7f5c5194026'
               'c07e6957d0b336cfe6ee8cdb4f5d0b7a20b8715cfa1a623b387972be2847271ff2ee99c339820e13c84921fb038fc605946e5724026c9b0e89f6945a2f195b39'
               '115bd531bf8d9560c4c43d398fa0067ea0450a91cb8fbdb9a078dbedcc761cff586e6bd36b83e6aa5eb85e62349d58651271dacff59f4504241645930ddfbb99')

package() {
  cd "$srcdir/"

  install -Dm755 $pkgname-$pkgver "$pkgdir/usr/bin/$pkgname"
  install -Dm644 rustymeter.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 rustymeter-root.desktop "$pkgdir/usr/share/applications/$pkgname-root.desktop"
  install -Dm644 chart-line-solid.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
