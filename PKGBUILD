# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pipname=nbclassic
pkgname=jupyter-$_pipname
pkgver=0.3.2
pkgrel=1
pkgdesc='Jupyter Notebook as a Jupyter Server Extension'
arch=(any)
url='https://jupyter.org/'
license=(custom)
depends=(jupyter-server jupyter-notebook)
makedepends=(python-setuptools)
source=(https://pypi.io/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz)
sha256sums=('863462bf6a6e0e5e502dcc479ce2ea1edf60437c969f1850d0c0823dba0c39b7')

build() {
  cd $_pipname-$pkgver
  python setup.py build 
}

package() {
  cd $_pipname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
