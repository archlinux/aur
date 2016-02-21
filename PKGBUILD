# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Ilkka Laukkanen <ilkka.s.laukkanen@gmail.com>

pkgname=landslide
pkgver=1.1.3
pkgrel=1
pkgdesc="Generate html5 slideshow from Markdown or reStructuredText sources"
arch=(any)
url="http://github.com/adamzap/landslide"
license=('Apache License')
depends=('python2' 'python2-pygments' 'python2-markdown' 'python2-jinja' 'python2-docutils')
makedepends=('python2-distribute')
optdepends=('princexml')
source=(http://pypi.python.org/packages/source/l/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('6cde698b3d6b28f7bff3800a7d18cbde191c5facb0d1aa56134f97982ca0edc7')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 ./setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 ./setup.py install --prefix=/usr/ --root=$pkgdir/
}
