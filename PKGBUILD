# Maintainer: NTMPO <alex.borodach2511@gmail.com>
pkgname=infofetch
pkgver=1.2
pkgrel=1
pkgdesc="infofetch is a simple neofetch-like system information tool written in C."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/NTMPO/infofetch"
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0b2ce9809088d50d3f0cdc8d0821503bbebc3e3842e204d801eda8422f4c0616')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
