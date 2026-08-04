pkgname=browsec-desktop
pkgver=1.3.2
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
sha256sums=('55b2dbc48b555f496092804cc42564c971e522dc96ad951ff6c355e780d042d6')

package() {
  cd "$srcdir"
  ar x "browsec-desktop_${pkgver}_amd64.deb"
  tar -xf data.tar.* -C "$pkgdir"
}
