pkgname='python-onvif'
_module='onvif'
_src_folder='onvif-0.2.0'
pkgver='0.2.0'
pkgrel=1
pkgdesc="Python Client for ONVIF Camera"
url="http://github.com/quatanium/python-onvif"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/fc/69/70c3cec902cac1dea2cfa40d1b2d959645daf383187f0a1061ec1fb60dec/onvif-0.2.0.tar.gz")
sha256sums=('8ea6802b6dca6fac3ba603d1c1ef22b29d5dcf36f534fb303cc3eb8674e9d180')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
