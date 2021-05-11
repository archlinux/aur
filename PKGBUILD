# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pipname=nbclassic
pkgname=jupyter-$_pipname
pkgver=0.2.8
pkgrel=1
pkgdesc="Jupyter Notebook as a Jupyter Server Extension"
arch=(any)
url="https://jupyter.org/"
license=(custom)
depends=(jupyter-server jupyter-notebook)
makedepends=(python-setuptools)
source=(https://pypi.io/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz)
sha256sums=('9553dcd9ae4d932db640dad0daa186fe6c64e69ec2159868c0b38d7adef9b3b5')

build() {
  cd $_pipname-$pkgver
  python setup.py build 
}

package() {
  cd $_pipname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
