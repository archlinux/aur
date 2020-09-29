# Maintainer: Aaron Rogers <aaron.kyle.rogers at gmail dot com>
pkgname=obd-auto-doctor
pkgver=3.7.2
pkgrel=1
pkgdesc="obd scan and diagnostics"
arch=('i686' 'x86_64')
url="http://www.obdautodoctor.com/"
license=('proprietary')

source_i686=("http://cdn.obdautodoctor.com/${pkgname}_${pkgver}_i386.tar.gz")
source_x86_64=("http://cdn.obdautodoctor.com/${pkgname}_${pkgver}_amd64.tar.gz")

sha1sums_i686=('b141b8279da73460023c706ac3dfe842bb24a0c7')
sha1sums_x86_64=('a20c255b0697b5a633e50fc941c5da12adf767b0')

depends=("qt5-base>=5.9.5")
optdepends=("bluez: for bluetooth support" "bluez-libs")

[[ "$CARCH" = "i686" ]] && _parch='i386'
[[ "$CARCH" = "x86_64" ]] && _parch='amd64'

package() {
	cd "$srcdir/obdautodoctor"
	install -D -m755 "./obdautodoctor" "${pkgdir}/usr/bin/obdautodoctor"
	
	install -D -m644 "./obdautodoctor.desktop" "${pkgdir}/usr/share/applications/obdautodoctor.desktop"
	install -D -m644 "./obdautodoctor.png" "${pkgdir}/usr/share/pixmaps/obdautodoctor.png"

	install -D -m644 "./license.txt" "${pkgdir}/usr/share/licenses/obdautodoctor/LICENSE"
}
