# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=xylose
pkgname=('python-scielo-xylose')
pkgver=1.33.1
pkgrel=2
pkgdesc="SciELO's library to abstract a JSON from ISIS2JSON type 3 results"
arch=('any')
url='https://github.com/scieloorg/xylose'
license=('BSD')
makedepends=('python-setuptools')
depends=('python-scielo-legendarium')
options=(!emptydirs)
sha256sums=('8e4bc2b4ea59850a2ee9b12a9e857440a05d25b76b4d75bf68afafb453026c6d'
            '611f9cee8598e86564f391797789c08e11877534727a9b235dce210bde17cf6b')
_pypi='https://files.pythonhosted.org/packages'
_path='d8/05/0a3e2d7057c44bd0bf1133f3a3a2d8520a94e9bf7387fa31c56ef38d046f'
_chash=0519212931883bd0dcc6d5dd476a710ff841dfee
source=("$_pypi/$_path/$_name-$pkgver.tar.gz"
  "https://raw.githubusercontent.com/scieloorg/xylose/$_chash/LICENSE")

prepare() {
  rm -rf "$srcdir/$_name-$pkgver/tests" # Avoid installing a "tests" package
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
