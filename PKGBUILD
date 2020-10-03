pkgname=obd-auto-doctor
pkgver=3.7.4
pkgrel=1
pkgdesc="obd scan and diagnostics"
arch=('i686' 'x86_64')
url="http://www.obdautodoctor.com/"
license=('proprietary')

source_i686=("http://cdn.obdautodoctor.com/${pkgname}_${pkgver}_i386.tar.gz")
source_x86_64=("http://cdn.obdautodoctor.com/${pkgname}_${pkgver}_amd64.tar.gz")

sha1sums_i686=('12a555b5ccddea50318c991f33910b8c2c0e2184')
sha1sums_x86_64=('43d0c14828a4b08893497dafbb5c2435888ae663')

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
