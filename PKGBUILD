# Maintainer Popolon <popolon @ popolon . org>
# generated using pip2pkgbuild --pep517

pkgbase='python-geovisio_cli'
pkgname=('python-geovisio_cli')
_module='geovisio_cli'
pkgver='0.3.14'
_src_folder="${_module}-${pkgver}"
pkgrel=1
pkgdesc="Geovio client cli tool"
url="https://panoramax.fr/"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:MIT License')
arch=('any')
source=("https://files.pythonhosted.org/packages/94/51/2b1a6359b0441f98a87e39b7bd66cd251579f52a42708d468a1bff7d8415/geovisio_cli-0.3.14.tar.gz")
sha256sums=('a44b1082be483219fb1dde3b1eb08d1aff27f2b4f8ffcdcd66e2908a1e78b41c')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
