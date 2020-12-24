# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pipname=nbclassic
pkgname=jupyter-$_pipname
pkgver=0.2.5
pkgrel=1
pkgdesc="Jupyter Notebook as a Jupyter Server Extension"
arch=(any)
url="https://jupyter.org/"
license=(custom)
depends=(jupyter-server)
makedepends=(python-setuptools)
source=(https://pypi.io/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz)
sha256sums=('e6da2116ab76a63de62f42cf8ea93c9a0c564aaf8315834f7c52efb85b4640ab')

build() {
  cd $_pipname-$pkgver
  python setup.py build 
}

package() {
  cd $_pipname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
