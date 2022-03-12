# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>

_pkgname=dipy
pkgname=python-dipy
pkgver=1.5.0
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
sha256sums=('73b3784914fa9b892479b65a994b3971b145fb58c9c6d346bf62cda4d9798da6')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --optimize=1 --root="$pkgdir"
}
