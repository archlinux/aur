# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=mkinitcpio-wireguard
pkgver=0.5.11
pkgrel=1
pkgdesc='mkinitcpio hook that initialises WireGuard to assist in the remote unlocking of encrypted partitions via ssh.'
arch=('x86_64')
url='https://github.com/dharrigan/mkinitcpio-wireguard'
license=('Unlicense')
install="${pkgname}.install"
depends=('mkinitcpio>=0.9.0' 'wireguard-tools' 'mkinitcpio-netconf' 'mkinitcpio-utils')
backup=('etc/wireguard/initcpio/unlock')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")

sha256sums=('dbe8388c479aaa22a8548ff19df2dbd364a27c8d5f01ba0975169d3468d942a7')

package() {
	install -Dm644 ${srcdir}/${pkgname}-${pkgver}/wireguard_hook ${pkgdir}/usr/lib/initcpio/hooks/wireguard
	install -Dm644 ${srcdir}/${pkgname}-${pkgver}/wireguard_install ${pkgdir}/usr/lib/initcpio/install/wireguard
	install -Dm644 ${srcdir}/${pkgname}-${pkgver}/wireguard_config ${pkgdir}/etc/wireguard/initcpio/unlock
	install -Dm644 ${srcdir}/${pkgname}-${pkgver}/UNLICENSED ${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSED
}


# vim:set syntax=sh tw=78:
