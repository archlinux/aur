# Maintainer: vantu5z <vantu5z@mail.ru>
# Python package author: Mikhail Korobov <kmike84@gmail.com>

pkgname=python-pymorphy2
pkgver=0.8
pkgrel=1
pkgdesc="Morphological analyzer (POS tagger + inflection engine) for Russian language."
arch=(any)
url="https://github.com/kmike/pymorphy2/"
license=(MIT license)
depends=("python-pymorphy2_dicts<3.0" "python-pymorphy2_dicts>=2.4"
         "python-docopt>=0.6"
         "python-dawg-python>=0.7")
optdepends=("python-pymorphy2-dicts-ru: russian language"
            "python-pymorphy2-dicts-uk: ukraine language")
makedepends=("python")
source=(https://github.com/kmike/pymorphy2/archive/$pkgver.tar.gz)
md5sums=('f83cfd1d482772e055bdd3c2e3547e03')

build()
  {
    cd "$srcdir/pymorphy2-$pkgver"
    python setup.py build
  }

package()
  {
    cd "$srcdir/pymorphy2-$pkgver"
    python setup.py install --root="$pkgdir/"
  }
