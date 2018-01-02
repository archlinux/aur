# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname='fava'
pkgdesc='Web interface for beancount'
pkgver=1.6
pkgrel=1
arch=('any')
url='https://github.com/beancount/fava'
license=('GPL')
source=("https://github.com/beancount/fava/archive/v${pkgver}.tar.gz")
sha256sums=('cef1d26a474a2d6ceeb794ff0a301d22cee409f5ecf8253a4807ff56903f1ebc')
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
