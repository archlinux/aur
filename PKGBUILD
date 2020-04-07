# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-pinyin
pkgver=0.37.0
pkgrel=1
pkgdesc="Chinese to Pinyin python library"
arch=('any')
url='https://pypinyin.readthedocs.io'
license=('MIT')
depends=('python-argparse'
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
source=("https://github.com/mozillazg/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('77bafcf3aa45f1e9255f042b57e29242')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/pypinyin/LICENSE"
}