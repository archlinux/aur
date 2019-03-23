# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Fabien Devaux <fdev31@gmail.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Ilkka Laukkanen <ilkka.s.laukkanen@gmail.com>

pkgname=landslide
pkgver=1.1.6
pkgrel=1
pkgdesc="Generate html5 slideshow from Markdown or reStructuredText sources"
arch=(any)
url="http://github.com/adamzap/landslide"
license=('Apache License')
depends=('python2' 'python2-pygments' 'python2-markdown' 'python2-jinja' 'python2-docutils')
makedepends=('python2-distribute' 'python2-six')
optdepends=('princexml')
source=('https://files.pythonhosted.org/packages/c9/7d/56b98d01d8094e9d23a4720a432c5ed4d76b19e6da2e8e3f1419b5e4f39e/landslide-1.1.6.tar.gz')
sha256sums=('93eb108768c6139896ee34ef0649d0daf8248f180b9f81962aa992311ab0a09a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's/==/>=/' setup.py

  python2 ./setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 ./setup.py install --prefix=/usr/ --root=$pkgdir/
}
