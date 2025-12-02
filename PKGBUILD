# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=wifiman-desktop
pkgver=1.2.8
pkgrel=1
pkgdesc="Network analysis and WiFi speed testing tool by Ubiquiti"
arch=('x86_64')
url="https://ui.com"
license=('LicenseRef-unknown')
depends=(
  'bash'
  'gtk3'
  'iw'
  'libayatana-appindicator'
  'libsoup3'
  'net-tools'
  'networkmanager'
  'webkit2gtk-4.1'
  'wireless_tools'
  'systemd'
)
install="$pkgname.install"
source=("https://desktop.wifiman.com/$pkgname-$pkgver-amd64.deb")
sha256sums=('47e31bc317e7055f5571859e33534cd3c2d7d4ccfdf9fcb8afab9920bc9d964b')

package() {
  bsdtar -xvf data.tar.gz -C "$pkgdir/"

  install -d "$pkgdir/usr/lib/systemd/system"
  ln -s "/usr/lib/wifiman-desktop/$pkgname.service" "$pkgdir/usr/lib/systemd/system/"
}
