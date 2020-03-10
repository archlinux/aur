# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=myipd
_pkgname=myip
pkgver=2
pkgrel=1
pkgdesc="Small http server returning your public ip"
arch=('x86_64')
url='https://git.sr.ht/~rumpelsepp/myip'
license=('GPL')
makedepends=('go-pie')
source=("$_pkgname-v$pkgver.tar.gz::https://git.sr.ht/~rumpelsepp/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('04d634d1458411553593b51e9ed36fcd4fb0483239114d801f0377192b60eef8')

build() {
    cd "$srcdir/$_pkgname-v$pkgver"
    make
}

package() {
    cd "$srcdir/$_pkgname-v$pkgver"
    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
