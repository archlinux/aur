# Maintainer: Tin Lai <oscar@tinyiu.com>
pkgname=x13as-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="X-13ARIMA-SEATS is seasonal adjustment software by the Census Bureau."
arch=('x86_64')
license=()
url="https://www.census.gov/data/software/x13as.About_X-13.html"
depends=()
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://www2.census.gov/software/x-13arima-seats/x13as/unix-linux/program-archives/x13as_ascii-v1-1-b58.tar.gz")
sha256sums=('698fc57c25b3855d5584306589c3d30e3f03f2f81bc67af52d19f1751550410b')

build() {
    tar -xvzf $pkgname-$pkgver.tar.gz
}

package() {
    cd x13as
    mkdir -p "${pkgdir}/usr/bin"
    mv x13as_ascii x13as
    install -m 755 x13as "${pkgdir}/usr/bin"
}
