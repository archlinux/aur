pkgname=browsec-desktop
pkgver=1.1.0
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
sha256sums=('2e79a4ee2645c77a257937681a501bcb2afeca5ad8346e6af4f1f45bc753322d')

package() {
  cd "$srcdir"
  ar x "browsec-desktop_${pkgver}_amd64.deb"
  tar -xf data.tar.* -C "$pkgdir"
}
