# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pipname=nbclassic
pkgname=jupyter-$_pipname
pkgver=0.2.7
pkgrel=1
pkgdesc="Jupyter Notebook as a Jupyter Server Extension"
arch=(any)
url="https://jupyter.org/"
license=(custom)
depends=(jupyter-server jupyter-notebook)
makedepends=(python-setuptools)
source=(https://pypi.io/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz)
sha256sums=('6835b27ffaed1f7a497371bb2c05c0f2b123cbcf7c3c116c1ca808ac78ac2fe8')

build() {
  cd $_pipname-$pkgver
  python setup.py build 
}

package() {
  cd $_pipname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
