# Maintainer: Enbeon <actuallyenbeon at gmail dot com>
_pkgname=jd-gui-duo
pkgname=jd-gui-duo-bin
pkgver=2.0.97
pkgrel=1
pkgdesc="Binary release of jd-gui-duo, a 2-in-1 JAVA decompiler based on JD-CORE v0 and v1"
arch=('any')
url="https://github.com/nbauma109/$_pkgname"
license=('GPL3')
depends=('java-runtime>=21')
provides=("jd-gui-duo")
conflicts=("jd-gui-duo")
source=(
	"$pkgname-$pkgver.zip::https://github.com/nbauma109/$_pkgname/releases/download/$pkgver/$_pkgname-linux-$pkgver.tar.xz"
	"jd-gui-duo"
	"jd-gui-duo.desktop"
	"jd_icon_128.png"
)
sha256sums=('cdb4aa1aec1f578b95f54538e5ac92769c010677da763ec3cf0efda2f681842c'
            '9d175e28662dd1ad701f76d5aa7f7752543453f156615b96787e641252ce60e4'
            'd40a09c9c228b55dcb54823b878cd180521386a11abffed478ce89439fd4e184'
            '62c763642af8cbfd1e00dc8763dcc92a66eefc7aceaa4069d29909bfc197240a')

package() {
	install -d "$pkgdir/usr/share/java/$_pkgname"
	cp -r "$srcdir/lib" "$pkgdir/usr/share/java/$_pkgname"
	install -Dm755 "jd-gui-duo" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "jd-gui-duo.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 "jd_icon_128.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
