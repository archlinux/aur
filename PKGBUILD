# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=wifiman-desktop
pkgver=1.3.0
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
optdepends=(
  'resolvconf: for DNS functionality'
  'sudo: elevate privileges'
)
install="$pkgname.install"
source=("https://desktop.wifiman.com/$pkgname-$pkgver-amd64.deb")
sha256sums=('2bb75b73c092e43592bbd40841628f222000bea95a28389aafe84adaf279cd78')

package() {
  bsdtar -xvf data.tar.gz -C "$pkgdir/"

  install -d "$pkgdir/usr/lib/systemd/system"
  ln -s "/usr/lib/wifiman-desktop/$pkgname.service" "$pkgdir/usr/lib/systemd/system/"
}
