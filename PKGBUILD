# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=mwic
pkgver=0.7.5
pkgrel=1
pkgdesc='Misspelled Words In Context'
arch=('any')
url=https://github.com/jwilk/mwic
license=('MIT')
depends=('python-pyenchant' 'python-regex')
checkdepends=('aspell-en' 'python-nose')
source=("$url/releases/download/$pkgver/mwic-$pkgver.tar.gz"{,.asc})
sha512sums=('6aa755267bf0d3d778d2ee56a71f04cd9cdfb163738a8524341539dc4f96f6a8200419305bc64c2decdbc27ef8bda5ee44b8cb680414b8043529cc2a3429c256'
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
