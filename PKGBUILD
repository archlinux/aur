# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname='fava'
pkgdesc='Web interface for beancount'
pkgver=1.7
pkgrel=1
arch=('any')
url='https://github.com/beancount/fava'
license=('GPL')
source=("https://files.pythonhosted.org/packages/py3/f/fava/fava-${pkgver}-py3-none-any.whl")
noextract=("fava-${pkgver}-py3-none-any.whl")
sha256sums=('04f3aae185789392e6ad292731e28bd0fdb00998ed11efafa0328c8e874c111e')
depends=('beancount' 'python-pip' 'python-click' 'python-markdown2' 'python-flask' 'python-flask-babel')

package () {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps fava-${pkgver}-py3-none-any.whl
  python -O -m compileall "${pkgdir}/usr/lib/python3.6/site-packages/${pkgname}/"
}
