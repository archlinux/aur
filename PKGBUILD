# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=zcfan
pkgver=1.3.0
pkgrel=1
pkgdesc='Zero-configuration fan control for ThinkPad'
url="https://github.com/cdown/zcfan"
license=('MIT')
arch=('any')
depends=()
makedepends=()
source=("https://github.com/cdown/zcfan/archive/${pkgver}.zip")
md5sums=('f014f3f3623cfe4b0ab3c66378c14168')

build() {
    cd -- "${srcdir?}/$pkgname-$pkgver"
    make prefix="/usr"
}

package() {
    cd -- "${srcdir?}/$pkgname-$pkgver"
    make prefix="/usr" DESTDIR="$pkgdir/" install
}
