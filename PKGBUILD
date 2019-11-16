# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=airvpn-beta-bin
pkgver=2.18.5
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
sha256sums_x86_64=('2ed0b4fdda930de0f39fada76230eeff1bc6e305ef349ff095ea32f8e7de42dc')
sha512sums_x86_64=('445b112f414084cea386827d8e1b7f3b72a92e811cb947c760c8035d5c6cb6a291c5462bf325000f8f23b28992b51db7a7119dfaac326943fe40dcc2108401a5')


package() {
  for _file in usr/{bin/*,lib/eddie-ui/*,share/{applications/*,doc/eddie-ui/*,eddie-ui/{*.pem,*.png,*.json,lang/*,webui/{*.html,css/*,fonts/*,images/{*.gif,*.png,about/*,app-icons/*,buttons/*,flags/*,icons/*,icons-png/*,icons-svg/*,log/*},js/*}},pixmaps/*,polkit-1/actions/*}}; do
    _octal=$(stat -c "%a" "$_file")
    install -Dm"${_octal}" "$_file" "${pkgdir}/$_file"
  done
}
