pkgname=openvpn-update-systemd-resolved
pkgver=1.3.0
pkgrel=1
pkgdesc="OpenVPN systemd-resolved Updater"
arch=("any")
url="https://github.com/jonathanio/update-systemd-resolved"
license=("GPL")
depends=("openvpn" "bash" "iproute2" "systemd>229")
source=("https://github.com/jonathanio/update-systemd-resolved/archive/v${pkgver}.tar.gz")
install=$pkgname.install
sha256sums=('ee88c1862cb7d197adfcb0e088530993e092f7035fdd95693827d6526f2817af')
sha512sums=('75b904502a084e8e8b72098772943ac4b7c0e7bd5dc20e8e9cb23f9372bd0a6ad8cc7ed50066e8599d18ce466ff7b4c48e7ab9e47b74d192caa33aba759c357f')

package() {
  cd $srcdir/update-systemd-resolved-${pkgver}
  install -D -m755 update-systemd-resolved "${pkgdir}/etc/openvpn/scripts/update-systemd-resolved"
  install -D -m644 update-systemd-resolved.conf "${pkgdir}/etc/openvpn/scripts/update-systemd-resolved.conf"
}

# vim:set ts=2 sw=2 et:
