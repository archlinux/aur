# Maintainer: isbest <icoderdev@outlook.com>

pkgname=com.xylink.linuxclient
pkgver=3.3.0.7571
pkgrel=2
pkgdesc="Xylink Video Conferencing linux client."
arch=('x86_64')
url="https://www.xylink.com"
license=('custom:xylink')
options=('!strip' '!emptydirs')
source_x86_64=(https://devcdn.ainemo.com/private_cloud/xinchuangclient/xinchuang3.3/signed_com.xylink.linuxclient_"$pkgver"-20220823_amd64.deb)
sha256sums_x86_64=('01952278f2910101ee00d745dc8964de691698a497e66c861cfaf5bbb596f2df')

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
