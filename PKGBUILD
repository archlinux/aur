# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=mwic
pkgver=0.7.6
pkgrel=1
pkgdesc='Misspelled Words In Context'
arch=('any')
url=https://github.com/jwilk/mwic
license=('MIT')
depends=('python-pyenchant' 'python-regex')
checkdepends=('aspell-en' 'python-nose')
source=("$url/releases/download/$pkgver/mwic-$pkgver.tar.gz"{,.asc})
sha512sums=('e22b66f5f79dff7276295e75f0fa3a418ef99ed25f193b22f5a9584ddfde60999613dab21e469e02e5e5c4b05e9804527dbee08bff2d284357caad261f30e217'
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
