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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mozillazg/python-pinyin/archive/v${pkgver}.tar.gz")
sha256sums=('0ff8b20190751fe8721a3167685121ec20f01fca3b67c510563c5cb7a29c34e5')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}