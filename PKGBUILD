# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=airvpn-bin
pkgver=2.18.9
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
source_x86_64=("eddie-ui_${pkgver}_linux_x64_arch.tar.xz"::"https://airvpn.org/mirrors/eddie.website/download/?platform=linux&arch=x64&ui=ui&format=arch.tar.xz&version=${pkgver}")
sha256sums_x86_64=('738026285e94dcdbd24cd0ddb240937b03ec195d1fe5e0b15635b18a1da3e5e1')
sha512sums_x86_64=('17b7803873299986479b6546042a419ebf7596cd574d86a43dfa45d146f6a3357ae2248abee9917993785a3b3873c188ce82fd5eded9d257cbd7afd96658728e')


package() {
  for _file in usr/{bin/*,lib/eddie-ui/*,share/{applications/*,doc/eddie-ui/*,eddie-ui/{*.pem,*.png,*.json,lang/*},pixmaps/*,polkit-1/actions/*}}; do
    _octal=$(stat -c "%a" "$_file")
    install -Dm"${_octal}" "$_file" "${pkgdir}/$_file"
  done
}
