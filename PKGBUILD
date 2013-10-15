# Maintainer: Yaron de Leeuw <jdlmail at gmail >
pkgname=python-natsort
_pkgname=natsort
pkgver=3.0.1
pkgrel=1
pkgdesc="Natural sorting for python"
arch=('any')
url="https://github.com/SethMMorton/natsort"
license=('MIT')
depends=('python')
makedepends=(python-setuptools)
source=("https://github.com/SethMMorton/natsort/archive/3.0.1.tar.gz")
md5sums=('bb1d10b1e0ab81c552d36085ee8759cc')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  
  #remove nasty "use_setuptools"
  # upstream was contacted: https://github.com/SethMMorton/natsort/issues/4
  sed -i 's/use_setuptools()//' setup.py

  python setup.py install --root="$pkgdir/" --optimize=1
}

