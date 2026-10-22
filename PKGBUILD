# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>

pkgname=python-opt-einsum-fx
_pkgname=opt_einsum_fx
pkgver=0.1.4
pkgrel=1
pkgdesc="Optimizing einsum with torch.fx"
arch=('any')
url="https://github.com/zasdfgbnm/opt-einsum-fx"
license=('MIT')
depends=(
    'python-pytorch'
    'python-opt_einsum'
    'python-packaging'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('7eeb7f91ecb70be65e6179c106ea7f64fc1db6319e3d1289a4518b384f81e74f')

build() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
