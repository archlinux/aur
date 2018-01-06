# Maintainer: kewl fft <kewl@alto.eu.org>

pkgname=dse
pkgver=1.30
pkgrel=1
pkgdesc="AES file encryption using a keyfile."
arch=('any')
url="https://github.com/kewlfft/dse"
makedepends=('gcc')
license=('MIT')
source=("https://github.com/kewlfft/dse/archive/v$pkgver.tar.gz")
sha256sums=('dd2c2f98be019026229d62a9da32f67a9be6ddcedbf82bfc7563cca3662c92bf')

build() {
    make -C $pkgname-$pkgver
}

package() {
    cd $pkgname-$pkgver
    install -Dm 0755 dse "$pkgdir/usr/bin/dse"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
