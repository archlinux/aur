# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>
# Contributor: Enes Hecan <nshecan@gmail.com>

pkgname=whatsapp-for-linux
pkgver=1.6.5
pkgrel=1
pkgdesc="An unofficial WhatsApp desktop application for linux"
url=https://github.com/eneshecan/$pkgname
arch=(i686 x86_64 armv7h aarch64)
license=(GPL3)
depends=(gtkmm3 webkit2gtk libayatana-appindicator libcanberra gst-plugins-base gst-plugins-good gst-plugins-bad gst-libav)
makedepends=(cmake git)
optdepends=('hunspell-en_us: spell-checking')
source=(git+$url#tag=v$pkgver)
b2sums=('f7b31f0f61903b5cb53a4d7f0402600e6b37659f11fe66c554388f35030bd7310d96b7a0c62591fbfaae368a7e100561ad40f34892595f452d2933c1f79cff3a')

build() {
    cd $pkgname
    cmake -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd $pkgname
    make DESTDIR="$pkgdir/" install
}
