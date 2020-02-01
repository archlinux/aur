# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=airvpn-beta-bin
pkgver=2.18.7
pkgrel=1
pkgdesc='AirVPN client "Eddie" based on OpenVPN, beta version.'
arch=('x86_64')
url=https://eddie.website
license=(GPL3)
depends=(mono openvpn sudo desktop-file-utils libnotify libappindicator-gtk2)
optdepends=('stunnel: VPN over SSL' 'openssh: VPN over SSH' 'libappindicator-gtk2: Tray icon w/GTK 2' 'libappindicator-gtk3: Tray icon w/GTK 3')
makedepends=('cmake')
provides=('airvpn' 'eddie-ui')
conflicts=('airvpn' 'airvpn-bin' 'airvpn-git' 'eddie-ui-git')
install=airvpn.install
source_x86_64=("eddie-ui_${pkgver}_linux_x64_arch.tar.xz"::'https://airvpn.org/mirrors/eddie.website/download/?platform=linux&arch=x64&ui=ui&format=arch.tar.xz&version=experimental')
sha256sums_x86_64=('8b307691e5b3d6f11f0f44b30c07c66cef2ff7ef691ebb4adcc159b2620b12bf')
sha512sums_x86_64=('8f7be8a843451e024704fcd43bbc14f94516bdcc2be453d91b94174c10c2af7296af4131d5081371c61969655d1cd9eb802a69c1b280f0ca028a421ca965323c')


package() {
  for _file in usr/{bin/*,lib/eddie-ui/*,share/{applications/*,doc/eddie-ui/*,eddie-ui/{*.pem,*.png,*.json,lang/*},pixmaps/*,polkit-1/actions/*}}; do
    _octal=$(stat -c "%a" "$_file")
    install -Dm"${_octal}" "$_file" "${pkgdir}/$_file"
  done
}
