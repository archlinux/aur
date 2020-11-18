# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-pinyin
pkgver=0.39.1
pkgrel=1
pkgdesc="Chinese to Pinyin python library"
arch=('any')
url='https://pypinyin.readthedocs.io'
license=('MIT')
depends=('python'
         'python-argparse'
         'python-bumpversion'
         'mypy'
         'python-pre-commit'
         'python-pytest'
         'python-pytest-cov'
         'python-path-and-address'
         'python-pytest-randomly'
         'python-sphinx'
         'python-tox'
         'twine'
         'python-wheel')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mozillazg/python-pinyin/archive/v${pkgver}.tar.gz")
sha256sums=('1815a5c341841411773af823fc05cf50fa73c690f7b4e1fcff60c4e868eb34a6')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
