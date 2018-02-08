# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=loqui
pkgver=0.6.4
pkgrel=1
pkgdesc="IRC client for the Gtk+-2.0 environment"
arch=('x86_64')
url="https://launchpad.net/loqui"
license=('GPL2')
depends=('gtk2')
makedepends=('python')
source=(http://launchpad.net/$pkgname/0.6/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('5130fb5b280bed07dbfbbd5cfc82b6c8')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
