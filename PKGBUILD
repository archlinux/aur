# Maintainer: Artem Fedulaev <artem.fedulaev11@email.com>
pkgname=lwm-wm
pkgver=1.0
pkgrel=1
pkgdesc="Legacy X11 window manager"
arch=('x86_64')
url="https://github.com/brokenallmute/lwm"
license=('MIT')
depends=('libx11')
makedepends=('gcc' 'make') 
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brokenallmute/lwm/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('be4b82b9a812ea20c0ab0a4776f7dee4897709f1f616d4b400d07f5032902a93')

build() {
    cd "lwm-${pkgver}"
    make
}

package() {
    cd "lwm-${pkgver}"
    make DESTDIR="$pkgdir" install
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}