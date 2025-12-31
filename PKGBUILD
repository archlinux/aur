# Maintainer: Artem Fedulaev <artem.fedulaev11@email.com>
pkgname=lwm-legacy
pkgver=1.2.1
pkgrel=1
replaces=('lwm-wm')
conflicts=('lwm-wm')
pkgdesc="Legacy X11 window manager"
arch=('x86_64')
url="https://github.com/brokenallmute/lwm"
license=('MIT')
depends=('libxinerama' 'libx11')
makedepends=('gcc' 'make') 
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brokenallmute/lwm/archive/refs/tags/${pkgver}.tar.gz")

sha256sums=('8217f8b85a13aff28cf7fe04f7fb71dd6cbf4b67ea36a403baf6856e4ffe58f4')

build() {
    cd "lwm-${pkgver}"
    make
}

package() {
    cd "lwm-${pkgver}"
    make DESTDIR="$pkgdir" install
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
