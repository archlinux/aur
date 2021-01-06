# Maintainer: Enes Hecan <nshecan@gmail.com>

pkgname=whatsapp-for-linux
pkgver=1.1.2
pkgrel=0
pkgdesc="An unofficial WhatsApp linux client desktop application."
url="https://github.com/eneshecan/whatsapp-for-linux"
arch=(x86_64 aarch64)
license=(GPL)
depends=(gtkmm3 webkit2gtk libappindicator-gtk3 nuspell hspell libvoikko aspell gst-plugins-base gst-plugins-good gst-plugins-bad gst-libav)
makedepends=(cmake)
provides=(whatsapp-for-linux)
conflicts=(whatsapp-for-linux)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('129be8a891d644cfeae6e27f3c337998')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release .
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
