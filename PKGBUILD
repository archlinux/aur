pkgname=cydownload
pkgver=1.1.1
pkgrel=1
pkgdesc="Download deb packages from repo straight to your device"
arch=('any')
license=('GPL')
source=("https://github.com/borishonman/$pkgname/archive/v$pkgver.tar.gz")
depends=('qt5-base')
md5sums=('55f6465886880206978ac269c3d9bcb7')

build() {
	cd "$pkgname-$pkgver"
	qmake cydownload.pro
	make
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm755 cydownload "$pkgdir"/usr/bin/cydownload
}
