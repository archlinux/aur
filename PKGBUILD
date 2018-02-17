# Maintainer: kewl fft <kewl@alto.eu.org>

pkgname=dse
pkgver=1.30
pkgrel=4
pkgdesc="AES file encryption using a keyfile"
arch=('x86_64')
url="https://github.com/kewlfft/dse"
makedepends=('glibc')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kewlfft/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('dd2c2f98be019026229d62a9da32f67a9be6ddcedbf82bfc7563cca3662c92bf')

build() {
    make -C $pkgname-$pkgver
}

package() {
    cd $pkgname-$pkgver
    install -Dm 0755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
