# Maintainer: Popolon <popolon @ popolon.org>
# made with pip2pkgbuild and tuned by hand

pkgname='python-geoconvert-cli'
_module='geoconvert-cli'
_src_folder='geoconvert_cli-0.1.0'
pkgver='0.1.0'
pkgrel=1
pkgdesc="Convert common geospatial files with one command. Probe inputs, batch convert, and reproject to WGS84 for KML."
url="https://github.com/switmer/geoconvert-cli"
depends=('python' 'python-pyproj')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:MIT License')
arch=('any')
source=("https://files.pythonhosted.org/packages/cc/93/8dff6110a92e3302a8d545b44317634bee154dadd6620a13544af7570d37/geoconvert_cli-0.1.0.tar.gz")
sha256sums=('19be8ba18026c63a9bce86586e9624c157099cdb33f0ea62a7644152624a407d')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
