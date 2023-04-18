# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-gcsfs'
_module='gcsfs'
pkgver='2023.4.0'
pkgrel=1
pkgdesc="Pythonic file-system interface for Google Cloud Storage."
url="http://gcsfs.readthedocs.io/en/latest/"
#checkdepends=('docker' 'python-pytest' 'python-pytest-timeout' 'python-vcrpy')
depends=('python' 'python-fsspec>=0.6.0' 'python-google-auth'
    'python-google-auth-oauthlib'
    'python-requests' 'python-decorator')
makedepends=()
optdepends=()
license=('BSD')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dask/gcsfs/archive/$pkgver.tar.gz")
sha256sums=('18ad72346f5a128a28324a889c1c1b0656a5d88e54e0f9b5a9446ab008d9935d')

#check() {
    #cd "${srcdir}/${_module}-${pkgver}"
    #pytest
#}

build() {
    cd "${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_module}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
