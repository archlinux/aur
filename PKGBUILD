# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=mkinitcpio-wireguard
pkgver=0.4.1
pkgrel=1
pkgdesc='mkinitcpio hook that initialises Wireguard to assist in the remote unlocking of encrypted partitions.'
url='https://github.com/dharrigan/mkinitcpio-wireguard'
arch=('x86_64')
license=('Unlicense')
install="${pkgname}.install"
depends=('mkinitcpio>=0.9.0' 'wireguard-tools')
backup=('etc/wireguard/initcpio/unlock')
source=('wireguard_hook' 'wireguard_install' 'wireguard_config' 'UNLICENSED')

package() {
	install -Dm644 ${srcdir}/wireguard_hook ${pkgdir}/usr/lib/initcpio/hooks/wireguard
	install -Dm644 ${srcdir}/wireguard_install ${pkgdir}/usr/lib/initcpio/install/wireguard
	install -Dm644 ${srcdir}/wireguard_config ${pkgdir}/etc/wireguard/initcpio/unlock
	install -Dm644 ${srcdir}/UNLICENSED ${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSED
}

sha256sums=(
'4d406d605297cdf11cc4de93616808063c255e4b54f27731d850acc71bf28b3b'
'67e56a6d5b3cab8cf1ae475f7728a9c0a148447da9d1246e53683f75fb1b6091'
'0dee9306a558623fc3c7bf22348f3049189e69be7c66bc7530fee0748fb9ad93'
'88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd'
)

# vim:set syntax=sh tw=78:
