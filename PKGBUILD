# Maintainer: kewl fft <kewl@alto.eu.org>

pkgname=dse
pkgver=1.20
pkgrel=1
pkgdesc="AES file encryption using a keyfile."
arch=('any')
url="http://members.ozemail.com.au/~nulifetv/freezip/freeware/index.html"
makedepends=('gcc')
license=('MIT')
source=("https://github.com/kewlfft/dse/archive/v$pkgver.tar.gz")
sha256sums=('1e3f7fa35908c52f8f016cfc71ba0465138bd343f25c27c0530a00ae481e0fb7')

build() {
    cd "$srcdir/dse-$pkgver"
    make
}

package() {
    cd "$srcdir/dse-$pkgver"
    install -Dm 0755 dse "$pkgdir/usr/bin/dse"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
