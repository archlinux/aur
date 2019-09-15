# Maintainer: Matej Groma <sbovdvvnir68a8hftegth9whs+arch-aur@matejgroma.com>
# Contributor: Aleš Katona <almindor@gmail.com>
# Contributor: Tomáš Havlas <tomas.havlas@raven-systems.eu>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=aspell-sk
pkgver=2.02
pkgrel=2
pkgdesc="Slovak dictionary for aspell"
arch=('any')
url="http://www.sk-spell.sk.cx/aspell-sk"
license=('custom')
depends=('aspell')
source=(http://www.sk-spell.sk.cx/files/aspell6-sk-$pkgver-0.tar.bz2)
sha512sums=('fcdf5c043168c887f93dfad5b9c6e07d9edd0c6194139e61bee2ba3928798792d8e8b446754bc55a67acc6d333034ebed9655cc3c15ad638f834b5a9efcc63cd')

package() {
  cd $srcdir/aspell6-sk-$pkgver-0
  ./configure || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  install -D -m644 Copyright $pkgdir/usr/share/licenses/$pkgname/LICENSE || return 1
}

