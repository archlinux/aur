# Maintainer: Maciej Dems <macdems@gmail.com>
pkgbase='python-dash-bootstrap-components'
pkgname=('python-dash-bootstrap-components')
_module='dash-bootstrap-components'
pkgver=1.4.1
pkgrel=1
pkgdesc="Bootstrap themed components for use in Plotly Dash"
url="https://dash-bootstrap-components.opensource.faculty.ai/"
depends=('python' 'python-dash')
makedepends=('python-setuptools')
license=('APACHE')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('05c2e2767a8ab104fc950d15482d09dde59d21f1e9bd5809d30672e61b7f420c')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
