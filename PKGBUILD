# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Jonathan Steel <jsteel at aur.archlinux.org>
# Contributor: DrZaius <lou at fakeoutdoorsman dot com>
# Contributor: Victor Feight <vrfeight3 at gmail dot com>
# Based on community/gsimplecal PKGBUILD

pkgname=gsimplecal-gtk2
_basename=gsimplecal
pkgver=2.1
pkgrel=1
pkgdesc="Simple and lightweight GTK calendar"
arch=('i686' 'x86_64')
url="http://dmedvinsky.github.com/${_basename}"
license=('BSD')
depends=('gtk2')
provides=("$_basename")
conflicts=("$_basename" "$_basename-git")
source=(https://github.com/dmedvinsky/${_basename}/archive/v$pkgver.tar.gz)
md5sums=('170ac0bdc8663d97dec436e45b195491')

build() {
  cd "$srcdir/${_basename}-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr --enable-gtk2

  make
}

package() {
  cd "$srcdir/${_basename}-$pkgver"

  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
