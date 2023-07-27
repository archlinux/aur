# Maintainer: Maciej Dems <macdems@gmail.com>
pkgbase='python-dash-bootstrap-components'
pkgname=('python-dash-bootstrap-components')
_module='dash-bootstrap-components'
_wheel='dash_bootstrap_components'
pkgver=1.4.2
pkgrel=1
pkgdesc="Bootstrap themed components for use in Plotly Dash"
url="https://dash-bootstrap-components.opensource.faculty.ai/"
depends=('python' 'python-dash')
makedepends=('python-setuptools' 'python-build' 'python-installer')
license=('APACHE')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('b7514be30e229a1701db5010a47d275882a94d1efff4c803ac42a9d222ed86e0')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel . --outdir "${srcdir}" --no-isolation
}

package() {
    python -m installer "${srcdir}/${_wheel}-${pkgver}-py3-none-any.whl" --destdir="${pkgdir}"
}
