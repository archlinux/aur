# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=zcfan
pkgver=1.2.1
pkgrel=1
pkgdesc='Zero-configuration fan control for ThinkPad'
url="https://github.com/cdown/zcfan"
license=('MIT')
arch=('any')
depends=()
makedepends=()
source=("https://github.com/cdown/zcfan/archive/${pkgver}.zip")
md5sums=('a31abbb6d342429752fb200b62aa7cbd')

build() {
    cd -- "${srcdir?}/$pkgname-$pkgver"
    make prefix="/usr"
}

package() {
    cd -- "${srcdir?}/$pkgname-$pkgver"
    make prefix="/usr" DESTDIR="$pkgdir/" install
}
