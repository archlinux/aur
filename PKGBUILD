# Maintainer: Maciej Dems <macdems@gmail.com>
pkgbase='python-dash-bootstrap-components'
pkgname=('python-dash-bootstrap-components')
_module='dash-bootstrap-components'
pkgver=0.13.1
pkgrel=1
pkgdesc="Bootstrap themed components for use in Plotly Dash"
url="https://dash-bootstrap-components.opensource.faculty.ai/"
depends=('python' 'python-dash')
makedepends=('python-setuptools')
license=('APACHE')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('04ad75c37bec005ac1cc0ff7bfb5645f3e2c75aacacfa11279c432f4c83ae70a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
