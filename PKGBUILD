# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-gcsfs')
_module='gcsfs'
pkgver='0.6.0'
pkgrel=1
pkgdesc="Pythonic file-system interface for Google Cloud Storage."
url="http://gcsfs.readthedocs.io/en/latest/"
checkdepends=('python-pytest' 'python-vcrpy')
depends=('python' 'python-fsspec>=0.6.0' 'python-google-auth'
    'python-google-auth-oauthlib'
    'python-requests' 'python-decorator')
makedepends=()
optdepends=()
license=('BSD')
arch=('any')
source=("https://github.com/dask/gcsfs/archive/$pkgver.tar.gz")
sha256sums=('b6593f31910d9c21b358948cc3c7677a964cd30130a98a305d18e8ee8a0bf039')

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    pytest
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
