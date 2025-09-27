# Maintainer: Woshiluo Luo <woshiluo@woshiluo.site>

pkgname=bililive-recorder-bin
_pkgname=bililive-recorder
provides=($_pkgname)
conflicts=($_pkgname)
pkgver=2.17.3
pkgrel=1
pkgdesc='B站录播姬 | BiliBili Stream Recorder | 哔哩哔哩直播录制'
arch=('x86_64')
options=(staticlibs)
url='https://github.com/Bililive/BililiveRecorder'
license=('GPL3')
provides=("$_pkgname")
depends=()
source=($pkgname-$pkgver.zip::https://github.com/Bililive/BililiveRecorder/releases/download/v$pkgver/BililiveRecorder-CLI-linux-x64.zip)
sha256sums=('bc05412b2ef5747a32c81705217eb8cac97acac0e32f6d76a6cf5ef9038884d3')

package() {
	cd $srcdir

	install -d $pkgdir/usr/lib/
	install -d $pkgdir/usr/bin/
	cp -ra . $pkgdir/usr/lib/bililive-recorder
	ln -s /usr/lib/bililive-recorder/BililiveRecorder.Cli "$pkgdir/usr/bin/BililiveRecorder.Cli"
}
