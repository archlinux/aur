# Maintainer: Enes Hecan <nshecan@gmail.com>

pkgname='whatsapp-for-linux'
pkgver=1.1.5
pkgrel=0
pkgdesc="An unofficial WhatsApp desktop application for linux"
url="https://github.com/eneshecan/whatsapp-for-linux"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL')
depends=('gtkmm3' 'webkit2gtk' 'libappindicator-gtk3' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-libav')
makedepends=('cmake')
provides=('whatsapp-for-linux')
conflicts=('whatsapp-for-linux')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('5c8d6f27c1825a1cdcb89a8557d0a041')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release .
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
