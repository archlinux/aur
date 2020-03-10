# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=myipd
_pkgname=myip
pkgver=1
pkgrel=1
pkgdesc="Small http server returning your public ip"
arch=('x86_64')
url='https://git.sr.ht/~rumpelsepp/myip'
license=('GPL')
makedepends=('go')
source=("$_pkgname-v$pkgver.tar.gz::https://git.sr.ht/~rumpelsepp/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0e5cb6c49b581cb766d504d8e580903d6c1fbe620c610220b424c4dfcbdc7836')

build() {
    cd "$srcdir/$_pkgname-v$pkgver"
    make
}

package() {
    cd "$srcdir/$_pkgname-v$pkgver"
    install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
