# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>
# Contributor: Enes Hecan <nshecan@gmail.com>

pkgname=whatsapp-for-linux
pkgver=1.6.1
pkgrel=1
pkgdesc="An unofficial WhatsApp desktop application for linux"
url=https://github.com/eneshecan/$pkgname
arch=(i686 x86_64 armv7h aarch64)
license=(GPL3)
depends=(gtkmm3 webkit2gtk libayatana-appindicator libcanberra gst-plugins-base gst-plugins-good gst-plugins-bad gst-libav)
makedepends=(cmake git)
source=(git+$url#tag=v$pkgver)
b2sums=(SKIP)

build() {
    cd $pkgname
    cmake -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd $pkgname
    make DESTDIR="$pkgdir/" install
}
