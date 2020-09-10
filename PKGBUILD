# Maintainer: Enes Hecan <nshecan@gmail.com>

pkgname=whatsapp-for-linux
pkgver=1.0.8
pkgrel=3
pkgdesc="An unofficial WhatsApp linux client desktop application."
url="https://github.com/eneshecan/whatsapp-for-linux"
arch=(x86_64 aarch64)
license=(GPL)
depends=(gtkmm3 webkit2gtk nuspell hspell libvoikko aspell gst-plugins-base gst-plugins-good gst-libav)
makedepends=(cmake)
provides=(whatsapp-for-linux)
conflicts=(whatsapp-for-linux)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('56d86e321e4d1acc569bb9c32ff79a22')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release .
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
