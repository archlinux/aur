# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>

pkgname=python-svglib
_name=svglib
pkgver=1.1.0
pkgrel=1
pkgdesc="A pure-Python library for reading and converting SVG files."
arch=('any')
url="https://pypi.python.org/pypi/$_name/$pkgver"
license=('LGPL')
options=(!emptydirs)
depends=('python'
         'python-lxml'
         'python-cssselect2'
         'python-tinycss2'
         'python-reportlab')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('520ee5290ee2ebeebd20ca0d7d995c08c903b364fcf515826bab43a1288d422e')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install -O1 --skip-build --root="$pkgdir"
}
