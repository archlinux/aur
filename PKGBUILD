# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=mwic
pkgver=0.7.8
pkgrel=1
pkgdesc='Misspelled Words In Context'
arch=('any')
url=https://github.com/jwilk/mwic
license=('MIT')
depends=('python-pyenchant' 'python-regex')
checkdepends=('aspell-en' 'python-nose')
source=("$url/releases/download/$pkgver/mwic-$pkgver.tar.gz"{,.asc})
sha512sums=('1045d34f18c9da844a31111c19f3a4fc617dd84db2e1566bfb838ec4fe098041d8836703b630e8e7093b48449da3a2cdf93105772e1bee1f3e64a45d76ccaa42'
            'SKIP')
validpgpkeys=('CDB5A1243ACDB63009AD07212D4EB3A6015475F5') # Jakub Wilk

check() {
  cd mwic-$pkgver
  make test
}

package() {
  cd mwic-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir"/usr/share/licenses/mwic doc/LICENSE
}

# vim:set ts=2 sw=2 et:
