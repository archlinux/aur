# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=mkinitcpio-wireguard
pkgver=0.1.0
pkgrel=1
pkgdesc='mkinitcpio hook that initialises Wireguard to assist in the remote unlocking of encrypted partitions.'
url='https://github.com/dharrigan/mkinitcpio-wireguard'
arch=('x86_64')
license=('Unlicense')
install="${pkgname}.install"
depends=('mkinitcpio>=0.9.0' 'wireguard-tools')
backup=('etc/wireguard/remote-unlock')
source=('wireguard_hook' 'wireguard_install' 'wireguard_config')

package() {
	install -o root -g root -D ${srcdir}/wireguard_hook ${pkgdir}/usr/lib/initcpio/hooks/wireguard
	install -o root -g root -D ${srcdir}/wireguard_install ${pkgdir}/usr/lib/initcpio/install/wireguard
	install -o root -g root -D ${srcdir}/wireguard_config ${pkgdir}/etc/wireguard/remote-unlock
}

sha256sums=(
'baa64d53adf5a60092c5df59c6ccf9e8253be4b7c947f89a9afd2cf0a84eea97'
'edf47fa52c1e5e802a5920b8fc3dea281d33c243e79364717c64588f384befaf'
'9385ec468589f0621d2a90839ebe4b38d37824ea706c2b2edf8f41b0f239f7e8'
)

# vim:set syntax=sh tw=78:
