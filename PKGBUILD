# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=loqui
pkgver=0.5.5
pkgrel=1
pkgdesc="IRC client for the Gtk+-2.0 environment"
arch=('i686' 'x86_64')
url="https://launchpad.net/loqui"
license=('GPL2')
depends=('gtk2' 'glib2' 'gnet')
source=(http://launchpad.net/$pkgname/0.5/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('e2ffbac4703de998c85ac68cb0b2fd86')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
