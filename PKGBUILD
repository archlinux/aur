# Maintainer: Enes Hecan <nshecan@gmail.com>

pkgname=whatsapp-for-linux
pkgver=1.0.8
pkgrel=1
pkgdesc="An unofficial WhatsApp linux client desktop application."
url="https://github.com/eneshecan/whatsapp-for-linux"
arch=(x86_64 aarch64)
license=(GPL)
depends=(gtkmm3 webkit2gtk nuspell hspell libvoikko aspell gst-plugins-base)
makedepends=(git cmake)
provides=(whatsapp-for-linux)
conflicts=(whatsapp-for-linux)
source=("git+https://github.com/eneshecan/whatsapp-for-linux")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    cmake . > /dev/null
    cat "src/VERSION"
}

build() {
    cd "$srcdir/$pkgname"
    cmake -DCMAKE_BUILD_TYPE=Release .
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
}
