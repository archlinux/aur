# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=mkinitcpio-wireguard
pkgver=0.4.10
pkgrel=1
pkgdesc='mkinitcpio hook that initialises Wireguard to assist in the remote unlocking of encrypted partitions.'
arch=('x86_64')
url='https://github.com/dharrigan/mkinitcpio-wireguard'
license=('Unlicense')
install="${pkgname}.install"
depends=('mkinitcpio>=0.9.0' 'wireguard-tools' 'mkinitcpio-netconf' 'mkinitcpio-utils')
backup=('etc/wireguard/initcpio/unlock')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")

sha256sums=('74bbdf9932c92668bd3a3069685f917301215b50ca854f4d523d6e21c454a1c2')

package() {
	install -Dm644 ${srcdir}/${pkgname}-${pkgver}/wireguard_hook ${pkgdir}/usr/lib/initcpio/hooks/wireguard
	install -Dm644 ${srcdir}/${pkgname}-${pkgver}/wireguard_install ${pkgdir}/usr/lib/initcpio/install/wireguard
	install -Dm644 ${srcdir}/${pkgname}-${pkgver}/wireguard_config ${pkgdir}/etc/wireguard/initcpio/unlock
	install -Dm644 ${srcdir}/${pkgname}-${pkgver}/UNLICENSED ${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSED
}


# vim:set syntax=sh tw=78:
