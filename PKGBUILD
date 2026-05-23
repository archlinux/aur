pkgname='python-cqkit'
_module='cqkit'
_src_folder='cqkit-0.5.8'
pkgver='0.5.8'
pkgrel=1
pkgdesc="A python library of CadQuery tools and helpers for building 3D CAD models."
url="https://github.com/michaelgale/cq-kit"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:MIT License')
arch=('any')
source=("https://files.pythonhosted.org/packages/fd/28/19e6b13256324f708bafa594dd6b76d0bb503dd2d0bd0b92ff1c117a81fb/cqkit-0.5.8.tar.gz")
sha256sums=('5176aa103050e0a15aae5d316d781afaa7d57b0df9d7c47925167c535a9e6f79')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
