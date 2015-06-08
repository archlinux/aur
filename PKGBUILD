# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Ilkka Laukkanen <ilkka.s.laukkanen@gmail.com>

pkgname=landslide
pkgver=1.1.1
pkgrel=1
pkgdesc="Generate html5 slideshow from Markdown or reStructuredText sources"
arch=(any)
url="http://github.com/adamzap/landslide"
license=('Apache License')
depends=('python2' 'python2-pygments' 'python2-markdown' 'python2-jinja' 'python2-docutils')
makedepends=('python2-distribute')
optdepends=('princexml')
source=(http://pypi.python.org/packages/source/l/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('645934b5bf4926a27e4e7b8b3ddd8e0e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 ./setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 ./setup.py install --prefix=/usr/ --root=$pkgdir/
}
