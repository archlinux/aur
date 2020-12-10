# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python-morfessor
pkgver=2.0.6
pkgrel=3
pkgdesc="A tool for unsupervised and semi-supervised morphological segmentation"
url="https://github.com/aalto-speech/morfessor"
arch=('any')
provides=('python-morfessor')
depends=('python')
makedepends=('python-setuptools')
_name="${pkgname#python-}"
_Name="Morfessor"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_Name-$pkgver.tar.gz")
sha256sums=('bb3beac234341724c5f640f65803071f62373a50dba854d5a398567f9aefbab2')

build() {
  cd "$srcdir/$_Name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_Name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
