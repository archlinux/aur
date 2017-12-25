# Maintainer: kewl fft <kewl@alto.eu.org>

pkgname=dse
pkgver=1.10
pkgrel=1
pkgdesc="AES file encryption using a keyfile."
arch=('any')
url="http://members.ozemail.com.au/~nulifetv/freezip/freeware/index.html"
makedepends=('gcc')
license=('MIT')
source=("https://github.com/kewlfft/dse/archive/v$pkgver.tar.gz")
sha256sums=('15849648e67023e552f3276902af79e854ce7cec786ba703baa76b0f2b6cb342')

build() {
    cd "$srcdir/dse-$pkgver"
    make
}

package() {
    cd "$srcdir/dse-$pkgver"
    install -Dm 0755 dse "$pkgdir/usr/bin/dse"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
