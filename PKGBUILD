# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>

_pkgname=dipy
pkgname=python-dipy
pkgver=1.4.1
pkgrel=1
pkgdesc="Diffusion MR imaging in Python"
arch=('x86_64')
url="https://dipy.org"
license=('BSD')
depends=(
    'python-h5py'
    'python-nibabel'
    'python-numpy'
    'python-packaging'
    'python-scipy'
    'python-tqdm'
)
makedepends=('python-setuptools' 'cython')
checkdepends=('python-pytest')
source=("https://github.com/nipy/dipy/archive/${pkgver}.tar.gz")
sha256sums=('56150f27eaa7ba406126d59ef4bf0d48ef6549a068c4c86c53978f326f9d5565')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --optimize=1 --root="$pkgdir"
}
