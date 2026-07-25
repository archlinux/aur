# Maintainer: Enbeon <actuallyenbeon at gmail dot com>
_pkgname=jd-gui-duo
pkgname=jd-gui-duo-bin
pkgver=2.0.114
pkgrel=1
pkgdesc="Binary release of jd-gui-duo, a 2-in-1 JAVA decompiler based on JD-CORE v0 and v1"
arch=('any')
url="https://github.com/nbauma109/$_pkgname"
license=('GPL-3.0')
depends=('java-runtime>=25')
provides=("jd-gui-duo")
conflicts=("jd-gui-duo")
source=(
	"$pkgname-$pkgver.zip::https://github.com/nbauma109/$_pkgname/releases/download/$pkgver/$_pkgname-linux-$pkgver.tar.xz"
	"jd-gui-duo"
	"jd-gui-duo.desktop"
	"jd_icon_128.png"
)
sha256sums=('751d31105a8bded6f11cdf82cc42e6bd7f0237bfde6e3b190578de860a96d81e'
            '7e3c81892a95aa411afe7a5dc93b5e7a891b1c52fcc65670a08b5b5618b8aafc'
            'd40a09c9c228b55dcb54823b878cd180521386a11abffed478ce89439fd4e184'
            '62c763642af8cbfd1e00dc8763dcc92a66eefc7aceaa4069d29909bfc197240a')

package() {
	install -d "$pkgdir/usr/share/java/$_pkgname"
	cp -r "$srcdir/lib" "$pkgdir/usr/share/java/$_pkgname"
	install -Dm755 "jd-gui-duo" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "jd-gui-duo.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 "jd_icon_128.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
