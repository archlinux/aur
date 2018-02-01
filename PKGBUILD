# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname='fava'
pkgdesc='Web interface for beancount'
pkgver=1.6
pkgrel=2
arch=('any')
url='https://github.com/beancount/fava'
license=('GPL')
source=("https://files.pythonhosted.org/packages/py3/f/fava/fava-${pkgver}-py3-none-any.whl")
noextract=("fava-${pkgver}-py3-none-any.whl")
sha256sums=('4f9d36f41b3240dded7c3bce930d823733c707aff2e0bc9b64c2ea50445e2f0c')
depends=('beancount' 'python-pip' 'python-click' 'python-markdown2' 'python-flask' 'python-flask-babel')

package () {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps *.whl
  python -O -m compileall "${pkgdir}/usr/lib/python3.6/site-packages/${pkgname}/"
}
