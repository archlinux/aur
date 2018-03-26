# Maintainer: Muges <git@muges.fr>
# Contributor: Alexis "Horgix" Chotad <alexis.horgix.chotard@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Markus Golser <elmargol@googlemail.com>

_pkgname=mygpoclient
pkgname=python-$_pkgname
pkgver=1.8
pkgrel=2
pkgdesc="Client library for the my.gpodder.org web service"
arch=('any')
url="https://github.com/gpodder/mygpoclient"
license=('GPL3')
depends=('python')
source=($_pkgname-$pkgver.tar.gz::https://github.com/gpodder/$_pkgname/archive/$pkgver.tar.gz)
md5sums=('e9648674b842ce5f6bb77a379eeb5908')

package() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1

  mv "$pkgdir"/usr/bin/mygpo-bpsync{,-python3}
  mv "$pkgdir"/usr/bin/mygpo-list-devices{,-python3}
  mv "$pkgdir"/usr/bin/mygpo-simple-client{,-python3}
  mv "$pkgdir"/usr/share/man/man1/mygpo-bpsync{,-python3}.1
}
