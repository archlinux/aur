# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=mkinitcpio-wireguard
pkgver=0.3.0
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
'0d173d068d440ab423386994c3bb3e7acef6a1380db3586adbded129d1e3975b'
'563e42ce30179df55132c10b295604e0a5a68d925890db55153764b4c3f959fe'
'e7a034b4239610be33ccb1001a0df947fb14cbe758b8f2825d8b890f2bfc043e'
)

# vim:set syntax=sh tw=78:
