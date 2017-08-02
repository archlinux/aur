# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname='fava'
pkgdesc='Web interface for beancount'
pkgver=1.5
pkgrel=1
arch=('any')
url='https://github.com/beancount/fava'
license=('GPL')
source=("https://github.com/beancount/fava/archive/v${pkgver}.tar.gz")
sha256sums=('339dd37d2bb558ef39eeafc51cb40a7e05b3b4084c108df6673788a28ce71384')
depends=('beancount' 'python-click' 'python-markdown2' 'python-flask' 'python-flask-babel')
makedepends=('npm')

package () {
  cd "${pkgname}-${pkgver}"
  pushd fava/static
  npm install
  popd
  make
  python setup.py install --prefix=/usr --root="${pkgdir}"
}
