# Maintainer: Woshiluo Luo <woshiluo@woshiluo.site>

pkgname=bililive-recorder-bin
_pkgname=bililive-recorder
provides=($_pkgname)
conflicts=($_pkgname)
pkgver=2.6.3
pkgrel=1
pkgdesc='B站录播姬 | BiliBili Stream Recorder | 哔哩哔哩直播录制'
arch=('x86_64')
options=(staticlibs)
url='https://github.com/Bililive/BililiveRecorder'
license=('GPL3')
provides=("$_pkgname")
depends=()
source=($pkgname-$pkgver.zip::https://github.com/Bililive/BililiveRecorder/releases/download/v$pkgver/BililiveRecorder-CLI-linux-x64.zip)
sha256sums=('70aca2baa2f737a0242b9fb395bdf9c52bc4e1ae414c5c567883468e93a1879f')

package() {
	cd $srcdir

	install -d $pkgdir/usr/lib/
	install -d $pkgdir/usr/bin/
	cp -ra . $pkgdir/usr/lib/bililive-recorder
	ln -s /usr/lib/bililive-recorder/BililiveRecorder.Cli "$pkgdir/usr/bin/BililiveRecorder.Cli"
}
