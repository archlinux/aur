# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: $pooky Hunter <spookyh+arch@gmail.org>

pkgname=rc-local
pkgver=3
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
	'7ac3eae0aee580448acbe386a3a2954990510790c42f2b9a0df293078d22dc14')

package() {
	install -Dm755 'rc.local' "${pkgdir}/etc/rc.local"
	install -Dm644 'rc-local.service' "${pkgdir}/usr/lib/systemd/system/rc-local.service"
}
