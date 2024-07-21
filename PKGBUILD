# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: $pooky Hunter <spookyh+arch@gmail.org>

pkgname=rc-local
pkgver=4
pkgrel=1
pkgdesc='Support for legacy rc.local scripts'
url="https://aur.archlinux.org/packages/${pkgname}/"
arch=('any')
license=('LGPL-2.1-or-later')
install="${pkgname}.install"
depends=('systemd')
backup=('etc/rc.local')
source=('rc.local'
	'rc-local.service')
sha512sums=('4c3f8498957d47cf2c6ed6d755f6d6a6e42a59ac176b5a752ea4cdd23418d009c180bd53609bc34a1b11f720d71e702d71b4014ae4f98008c89f86323dc9afab'
            '85c7eafe5d79c4829b48c4df867e28bdb0b4464cab3581fd67e288648d416ceb69fe4e6b5193f86517f1e9578ef05fba8f708097625de6b903c6794fbec5078e')

package() {
	install -Dm755 'rc.local' "${pkgdir}/etc/rc.local"
	install -Dm644 'rc-local.service' "${pkgdir}/usr/lib/systemd/system/rc-local.service"
}
