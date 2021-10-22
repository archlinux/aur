# Maintainer: Maciej Dems <macdems@gmail.com>
pkgbase='python-dash-bootstrap-components'
pkgname=('python-dash-bootstrap-components')
_module='dash-bootstrap-components'
pkgver=1.0.0
pkgrel=1
pkgdesc="Bootstrap themed components for use in Plotly Dash"
url="https://dash-bootstrap-components.opensource.faculty.ai/"
depends=('python' 'python-dash')
makedepends=('python-setuptools')
license=('APACHE')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('498164307c3a05b295fcf92cc4e39a91f6eed5be6d960b03081feb8f791adf94')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
