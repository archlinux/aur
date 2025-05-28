# Maintainer: Michał Przybyś <michal@przybys.eu>
pkgname=spek
pkgver=0.8.5
pkgrel=2
pkgdesc='An acoustic spectrum analyser'
arch=(x86_64)
url='http://spek.cc/'
license=(GPL3)
depends=(ffmpeg wxwidgets-gtk3)
source=("https://github.com/alexkay/spek/releases/download/v${pkgver}/spek-${pkgver}.tar.xz")
sha256sums=('1bccf85a14a01af8f2f30476cbad004e8bf6031f500e562bbe5bbd1e5eb16c59')

build() {
    cd "spek-${pkgver}"
    ./configure --prefix=/usr --mandir=/usr/share/man
    make
}

package() {
    cd "spek-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
