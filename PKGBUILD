# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: $pooky Hunter <spookyh+arch@gmail.org>

pkgname=rc-local
pkgver=4
pkgrel=1
pkgdesc='Support for legacy rc.local scripts'
url="https://aur.archlinux.org/packages/${pkgname}/"
arch=('any')
license=('LGPL2.1')
install="${pkgname}.install"
depends=('systemd')
backup=('etc/rc.local')
source=('rc.local'
	'rc-local.service')
sha256sums=('8aa661c15cf9a35c32c79055bf69ab2d16354128ddd67a1bce0a7e48fe26f2e3'
	'f8c4f7a72833bb568bd4848ad16442cb3150b438184e0a6d30348fb518f969ae')

package() {
	install -Dm755 'rc.local' "${pkgdir}/etc/rc.local"
	install -Dm644 'rc-local.service' "${pkgdir}/usr/lib/systemd/system/rc-local.service"
}
