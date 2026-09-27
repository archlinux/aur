# Maintainer : MorsMortium <mors.mortium.8@protonmail.com>

pkgname="gtk-nocsd"
pkgver=4.8
pkgrel=1
pkgdesc="An LD_PRELOAD library to disable CSD in GTK3/4, LibHandy, and LibAdwaita apps."
arch=("x86_64")
url="https://codeberg.org/MorsMortium/${pkgname}"
license=("GPL-3.0-or-later")
provides=("gtk3-nocsd" "gtk4-nocsd")
conflicts=("gtk3-nocsd" "gtk4-nocsd")
replaces=("gtk3-nocsd" "gtk4-nocsd")
makedepends=("libadwaita")
sha512sums=("421e32381e5871959b4cb762e66b618907a2145bfd3042432e6289050f6e0fd0d0af7782e2d89a8edbe97b6914a52fd846867ceea1aafd7abfed391834c47a92")
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/MorsMortium/$pkgname/archive/$pkgver.tar.gz")

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make install DESTDIR="${pkgdir}" PREFIX="/usr" LIBDIR="/usr/lib"
}
