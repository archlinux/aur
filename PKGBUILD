# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=mkinitcpio-wireguard
pkgver=0.2.0
pkgrel=1
pkgdesc='mkinitcpio hook that initialises Wireguard to assist in the remote unlocking of encrypted partitions.'
url='https://github.com/dharrigan/mkinitcpio-wireguard'
arch=('x86_64')
license=('Unlicense')
install="${pkgname}.install"
depends=('mkinitcpio>=0.9.0' 'wireguard-tools')
backup=('etc/wireguard/initcpio/unlock')
source=('wireguard_hook' 'wireguard_install' 'wireguard_config')

package() {
	install -o root -g root -D ${srcdir}/wireguard_hook ${pkgdir}/usr/lib/initcpio/hooks/wireguard
	install -o root -g root -D ${srcdir}/wireguard_install ${pkgdir}/usr/lib/initcpio/install/wireguard
	install -o root -g root -D ${srcdir}/wireguard_config ${pkgdir}/etc/wireguard/initcpio/unlock
}

sha256sums=(
'cf4027c5c88a521f76ecfe257ee0bbcaf24294f8dcc97b8128cf77a3cd547d09'
'5bbbe54b9bd0469537c74f892fd30fcb90e9b49143addc7a03f4366419d6bff6'
'7e6c925ba973a90f63100a1a56b2e57f017d1155c1d0514f38cf9eeca557bd99'
)

# vim:set syntax=sh tw=78:
