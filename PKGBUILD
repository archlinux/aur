# Maintainer: Abdelhakim AKODADI <abdelhakim at akodadi dot com>

pkgname=cisco-anyconnect-runit
pkgalias=vpnagentd
_realname=cisco-anyconnect-runit
pkgdesc="runit service script for cisco-anyconnect"
pkgver=4.9.05042
pkgrel=1
pkgbase=cisco-anyconnect-runit
replaces=('cisco-anyconnect-runit')
arch=('any')
url='https://aur.archlinux.org/packages/cisco-anyconnect-runit'
license=('Apache')
groups=()
depends=('runit' 'elogind-runit')
optdepends=('cisco-anyconnect: Otherwise, you can install it using the script provided by Cisco. Refer to https://www.cisco.com/c/en/us/support/security/anyconnect-secure-mobility-client-v4-x/model.html to download it.')
source=('vpnagentd.run' 'vpnagentd.log.run')
sha256sums=(
	"9cc8483cc6fde8db0a7d21354f65f14fd179bda8434199b26866cdc6db2af7ba"
	"70eeb7eb8a14d32b686657b5117f06ae04926dedf0794744ed06da13403cb697"
)

package() {
	install -Dm755 vpnagentd.run "$pkgdir"/etc/runit/sv/vpnagentd/run
	install -Dm755 vpnagentd.log.run "$pkgdir"/etc/runit/sv/vpnagentd/log/run
	install -d /var/log/vpnagentd
}
