# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=loqui
pkgver=0.7.0
pkgrel=1
pkgdesc="IRC/Chat client for a Gtk environment"
arch=('x86_64')
url="https://loqui.sunnyone.org/"
license=('GPL2')
depends=('gtk3')
makedepends=('python')
source=(https://github.com/sunnyone/loqui/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('c593211d6bb477d5477ec9b81143e3faf96e859ad2edaf527fbc370333e5e0e7')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
