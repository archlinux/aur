# Maintainer: Artem Fedulaev <artem.fedulaev11@email.com>
pkgname=lwm-legacy
pkgver=1.2
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

sha256sums=('1bfa5352bdf22f1da6769ceebb1955e6e422dfb0d57bc25e4dc2b6d0c12f4781')

build() {
    cd "lwm-${pkgver}"
    make LDLIBS="-lXinerama"
}

package() {
    cd "lwm-${pkgver}"
    make DESTDIR="$pkgdir" install
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
