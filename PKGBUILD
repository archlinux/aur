# Maintainer : carukia <hornetsnest0@gmail.com
# Contributor: Thomas Krug <phragment@lavabit.com>
pkgname=pidgin-awayonlock
pkgver=0.5.2
pkgrel=2
pkgdesc="Sets you as away when the screensaver gets activated."
arch=('i686' 'x86_64')
url="http://costela.net/projects/awayonlock/"
license=('GPL')
depends=('pidgin' 'gnome-screensaver>=2.26.0')
makedepends=('cmake')
source=("http://costela.net/files/awayonlock-${pkgver}.tar.gz")
md5sums=('4601543ca8efbaed9ed71e726c119c5d')

package() {
  cd "$srcdir/awayonlock-${pkgver}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr/ ./ || return 1

  make || return 1

  make DESTDIR="$pkgdir" install || return 1
}
