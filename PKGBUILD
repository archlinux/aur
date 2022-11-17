# Maintainer: Zero <zero@cock.li>
# Contributor: voj343 <voj343@yandex.com>

pkgname=mullvad-vpn-openrc
pkgver=1.0
pkgrel=2
pkgdesc="OpenRC service for Mullvad VPN"
arch=('any')
url='https://aur.archlinux.org/packages/mullvad-vpn-openrc'
license=('GPL')
depends=('openrc' 'mullvad-vpn')
source=('mullvad-daemon.rc' 'mullvad-early-boot-blocking.rc' 'mullvad.install')
sha256sums=("30d4add10f0673de2fb49ca017fe6d6c939262acf6369138fdda14eae697923a"
            "4127f351a7eea23b6a9cd2012efa7600683aeb56d7e32b62d627415fcd3c10ce"
            "9e81c3f1b97d3c26a4a5d5216d18147cf9b0307b4208cfaa441f4700975f6cde")

package() {
  install -Dm755 ${srcdir}/mullvad-daemon.rc "$pkgdir"/etc/init.d/mullvad-daemon
  install -Dm755 ${srcdir}/mullvad-early-boot-blocking.rc "$pkgdir"/etc/init.d/mullvad-early-boot-blocking
  install=mullvad.install
}
