# Maintainer: 10sr <8slashes+arch [at] gmail [dot] com>
# Contributor: Krzysztof Wloch <wloszekk [at] gmail [dot] com>
# Contributor: Dries De Smet <driesdesmet at gmail dot com>

pkgname=neap-hotkey
#_pkgname=neap
pkgver=0.8.4
pkgrel=2
pkgdesc="A simple pager that runs in the notification area / systray with hotkey support"
arch=(any)
url="https://github.com/10sr/neap"
license=('custom:BSD-new')
depends=('pygtk' 'python2-xlib')
optdepends=('python2-keybinder2: For hotkeys')
provides=('neap=0.8.3')
#conflicts=('neap')
install="neap.install"
source=("neap-$pkgver.tar.gz::https://github.com/10sr/neap/archive/v$pkgver.tar.gz"
	"neap.desktop")

md5sums=('3eb6b00f34debba2a6f2b9a9e1474acf'
         '1381dc63a794afc83706590bff8a623d')

package() {
	install -D -m 644 neap.desktop ${pkgdir}/usr/share/applications/$pkgname.desktop

	cd ${srcdir}/neap-$pkgver

	install -D -m 644 License.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -D -m 644 README	${pkgdir}/usr/share/${pkgname}/README
	install -D -m 644 ChangeLog 	${pkgdir}/usr/share/${pkgname}/ChangeLog
	
	sed -i 's/python$/python2/g' neap
	install -D -m 755 neap ${pkgdir}/usr/bin/${pkgname}
}
