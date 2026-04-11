# Maintainer: NTMPO <alex.borodach2511@gmail.com>
pkgname=infofetch
pkgver=1.3.1
pkgrel=1
pkgdesc="infofetch is a simple neofetch-like system information tool written in C."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/NTMPO/infofetch"
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1ee98a717fd5b79f70cb18ac8785a0b9de45c37aa7d4193ac5657e430464f3cf')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
