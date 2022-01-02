# Maintainer: Enes Hecan <nshecan@gmail.com>

pkgname='whatsapp-for-linux'
pkgver=1.3.2
pkgrel=1
pkgdesc="An unofficial WhatsApp desktop application for linux"
url="https://github.com/eneshecan/whatsapp-for-linux"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL')
depends=('gtkmm3' 'webkit2gtk' 'libappindicator-gtk3' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-libav')
makedepends=('cmake')
provides=('whatsapp-for-linux')
conflicts=('whatsapp-for-linux')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('4d3e4e2426ddbbbad4c5c7b74f169d46')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
