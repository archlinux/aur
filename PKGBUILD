pkgname=browsec-desktop
pkgver=1.4.2
pkgrel=1
pkgdesc="Browsec Desktop VPN client"
arch=('x86_64')
url="https://browsec.com/en/linux-vpn"
license=('custom')
depends=(
  'gtk3'
  'nss'
  'alsa-lib'
  'libxss'
  'libxtst'
  'xdg-utils'
  'libnotify'
  'libappindicator-gtk3'
)
makedepends=('binutils' 'tar')
options=('!strip' '!debug')
source=("browsec-desktop_${pkgver}_amd64.deb::https://github.com/brwinfo/desktop-release/releases/download/v${pkgver}/browsec-desktop_${pkgver}_amd64.deb")
sha256sums=('22a3a3278270ebda09d6b2c6b5e7cd04ae0a62ad11492a7d634a292c4e0f6fb1')

package() {
  cd "$srcdir"
  ar x "browsec-desktop_${pkgver}_amd64.deb"
  tar -xf data.tar.* -C "$pkgdir"
}
