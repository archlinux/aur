# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>
# Contributor: Enes Hecan <nshecan@gmail.com>

pkgname=whatsapp-for-linux
pkgver=1.7.0
pkgrel=1
pkgdesc="An unofficial WhatsApp desktop application for linux"
url=https://github.com/eneshecan/$pkgname
arch=(i686 x86_64 armv7h aarch64)
license=(GPL3)
depends=(gtkmm3 webkit2gtk libayatana-appindicator libcanberra gst-plugins-base gst-plugins-good gst-plugins-bad gst-libav)
makedepends=(cmake git)
optdepends=('hunspell-en_us: spell-checking')
source=(git+$url#tag=v$pkgver)
b2sums=('1a14e9582654204dea6fe361d8f8e29f1b5b9a5266bfe292f8423df4602364a0c0989c4089ec86ced18c4e292600aa10d8f2b01fa62707c6edfa612aa224d679')

build() {
    cd $pkgname
    cmake -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd $pkgname
    make DESTDIR="$pkgdir/" install
}
