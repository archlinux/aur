# Maintainer: Ali Riza Keskin <aliriza.keskin@pardus.org.tr>
pkgname="pardus-lightdm-greeter"
pkgver="0.0.3"
pkgrel=1
pkgdesc="A customizable lightdm greeter for Pardus GNU/Linux."
arch=("any")
url="https://github.com/pardus/pardus-lightdm-greeter"
license=(GPL3)
makedepends=("make")
source=("https://github.com/pardus/$pkgname/archive/refs/tags/debian/$pkgver.zip")
md5sums=("7021671ddb57ed9cffbcdce905d7f0d0")

depends=(
    python-gobject
    python-xlib
    gtk3
    lightdm
)

build() {
    cd "$pkgname-debian-$pkgver"
    make
}

package() {
  cd "$pkgname-debian-$pkgver"
  make install DESTDIR="${pkgdir}"
}
