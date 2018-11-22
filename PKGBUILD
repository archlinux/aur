# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=xylose
pkgname=('python-scielo-xylose')
pkgver=1.34.1
pkgrel=1
pkgdesc="SciELO's library to abstract a JSON from ISIS2JSON type 3 results"
arch=('any')
url='https://github.com/scieloorg/xylose'
license=('BSD')
makedepends=('python-setuptools')
depends=('python-scielo-legendarium')
options=(!emptydirs)
sha256sums=('5f0b343003e90a600f4b58d9971caeee98d9cb69cce677d8c1681cd0e78753c9'
            '611f9cee8598e86564f391797789c08e11877534727a9b235dce210bde17cf6b')
_pypi='https://files.pythonhosted.org/packages'
_path='eb/98/af79056f6fd0c470bebf08c584a77c46c71ab13dc3eeeef15016d8d5d825'
_chash=2050c1019c1a70b945faeea3fd9b948309db9a0f
source=("$_pypi/$_path/$_name-$pkgver.tar.gz"
  "https://raw.githubusercontent.com/scieloorg/xylose/$_chash/LICENSE")

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
