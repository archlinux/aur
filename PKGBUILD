# Maintainer: Enes Hecan <nshecan@gmail.com>

pkgname='whatsapp-for-linux'
pkgver=1.1.3
pkgrel=2
pkgdesc="An unofficial WhatsApp desktop application for linux"
url="https://github.com/eneshecan/whatsapp-for-linux"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL')
depends=('gtkmm3' 'webkit2gtk' 'libappindicator-gtk3' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-libav')
makedepends=('cmake')
provides=('whatsapp-for-linux')
conflicts=('whatsapp-for-linux')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('050daeec0d37cc40db6c7abcf36d386e')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release .
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
