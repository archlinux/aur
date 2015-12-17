# Maintainer: Aaron Rogers <aaron.kyle.rogers at gmail dot com>
pkgname="obd-auto-doctor"
pkgver="3.0.2"
pkgrel="2"
pkgdesc="obd scan and diagnostics"
arch=('i686' 'x86_64')
url="http://www.obdautodoctor.com/"
license="LGPL3"

source_i686=("http://cdn.obdautodoctor.com/${pkgname}_${pkgver}_i386.tar.gz")
source_x86_64=("http://cdn.obdautodoctor.com/${pkgname}_${pkgver}_amd64.tar.gz")
md5sums_i686=('888f3cc55467ba6440b47c6eab9b411e')
md5sums_x86_64=('0ec6b23f98319d298c10d10615e67576')

optdepends=("bluez: for bluetooth support")

[[ "$CARCH" = "i686" ]] && _parch='i386'
[[ "$CARCH" = "x86_64" ]] && _parch='amd64'

package() {
	cd "$srcdir/obdautodoctor"
	install -D -m755 "./obdautodoctor" "${pkgdir}/usr/bin/obdautodoctor"
	
	install -D -m644 "./obdautodoctor.desktop" "${pkgdir}/usr/share/applications/obdautodoctor.desktop"
	install -D -m644 "./obdautodoctor.png" "${pkgdir}/usr/share/pixmaps/obdautodoctor.png"

	install -D -m644 "./license.txt" "${pkgdir}/usr/share/licenses/obdautodoctor/LICENSE"
}



