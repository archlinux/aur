# Maintainer: Florian Pelz <pelzflorian at pelzflorian.de>
pkgname=pacpak
pkgver=0.1
pkgrel=1
pkgdesc="Create Flatpak apps from pacman packages"
arch=('any')
url="https://pelzflorian.de/git/pacpak/"
license=('GPL3')
depends=('flatpak' 'fakeroot' 'fakechroot' 'sudo')
source=("https://pelzflorian.de/${pkgname}-${pkgver}.tar.gz")
sha512sums=('174774b8ea8b15b341218abca9616da321b67916f90d1983418d52c8dbfd0999266c614b648fa391edcc17320c4c7870d36ffe2e0008ee535f3e0dc5226cdd5a')

build() {
  cd "$pkgname"-"$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname"-"$pkgver"
  make check
}

package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  make DESTDIR="$pkgdir/" install
}
