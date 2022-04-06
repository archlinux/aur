# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=zcfan
pkgver=1.1.1
pkgrel=1
pkgdesc='Zero-configuration fan control for ThinkPad'
url="https://github.com/cdown/zcfan"
license=('MIT')
arch=('any')
depends=()
makedepends=()
source=("https://github.com/cdown/zcfan/archive/${pkgver}.zip")
md5sums=('24c2c31762ad71ec822b3fa0d839fbae')

build() {
    cd -- "${srcdir?}/$pkgname-$pkgver"
    make zcfan
}

package() {
    cd -- "${srcdir?}/$pkgname-$pkgver"
    mkdir -p "$pkgdir"/usr/bin "$pkgdir"/usr/lib/systemd/system
    cp -a zcfan "$pkgdir"/usr/bin
    cp -a zcfan.service "$pkgdir"/usr/lib/systemd/system
}
