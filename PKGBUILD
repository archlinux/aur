# Maintainer: isbest <icoderdev@outlook.com>

pkgname=com.xylink.linuxclient
pkgver=3.3.0.7571
pkgrel=1
pkgdesc="Xylink Video Conferencing linux client."
arch=('x86_64')
url="https://www.xylink.com"
license=('custom:xylink')
options=('!strip' '!emptydirs')
source_x86_64=(file://com.xylink.linuxclient_${pkgver}-20220823_amd64.deb)
sha256sums_x86_64=('d29b55bd876e48309266ed6b1938e9f0f7b3bcddc919ef63703e266c9147ebf5')

package(){
	echo "-> Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"

	echo "-> Remove redundant files..."
	rm -rf "$pkgdir"/com.xylink.linuxclient_"$pkgver"-20220823_amd64.deb

	# License
	install -D -m644 "$pkgdir"/opt/apps/com.xylink.linuxclient/files/share/doc/nvidia-graphics-driver/copyright \
	"$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

	echo "-> Fix file system permission..."
	chmod 755 "$pkgdir"/usr/share/icons/hicolor/scalable
	chmod 755 "$pkgdir"/usr/share/icons/hicolor/scalable/apps

	chmod +x "$pkgdir"/opt/apps/com.xylink.linuxclient/files/bin/XYWinQTPri
	chmod +x "$pkgdir"/opt/apps/com.xylink.linuxclient/files/launch.sh
}
