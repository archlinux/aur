# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=mwic
pkgver=0.7.4
pkgrel=1
pkgdesc='Misspelled Words In Context'
arch=('any')
url=https://github.com/jwilk/mwic
license=('MIT')
depends=('python-pyenchant' 'python-regex')
checkdepends=('aspell-en' 'python-nose')
source=("$url/releases/download/$pkgver/mwic-$pkgver.tar.gz"{,.asc})
sha512sums=('331002dadb83e414513993b300ec9c4cd6381f59ce0ae1002b33bfb3e73c5ca891a4afbf99118ac901a8bd98e8c3ee95a4716e194badb8ce3d198e7690a73e81'
            'SKIP')
validpgpkeys=('CDB5A1243ACDB63009AD07212D4EB3A6015475F5') # Jakub Wilk

check() {
  cd mwic-$pkgver
  make test
}

package() {
  cd mwic-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 doc/LICENSE "$pkgdir"/usr/share/licenses/mwic/LICENSE
}

# vim:set ts=2 sw=2 et:
