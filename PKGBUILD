# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=zeebe-modeler
pkgver=0.6.2
pkgrel=2
pkgdesc="Desktop Application for modeling Zeebe Workflows with BPMN"
arch=('x86_64')
url="https://github.com/zeebe-io/zeebe-modeler"
license=('MIT')
depends=('nodejs' 'xdg-utils')
makedepends=('tar')
install=$pkgname.install
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/zeebe-io/zeebe-modeler/releases/download/v$pkgver/zeebe-modeler-$pkgver-linux-x64.tar.gz"
	"$pkgname.patch"
	"$pkgname.install")

prepare() {
	cd "$srcdir/$pkgname-$pkgver-linux-x64"
	patch --strip=1 --input=$srcdir/$pkgname.patch
}

package() {
	install -d $pkgdir/opt/$pkgname
	cp -R $srcdir/$pkgname-$pkgver-linux-x64/* $pkgdir/opt/$pkgname
}
md5sums=('892b48eacdc2693180f731f484d12470'
         'd997b6d6c3831e0eb8a87b0ae59aa730'
         '615f2fe722cc5b3eea9c9ea9d22bdafd')
