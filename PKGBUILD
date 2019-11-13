# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-gcsfs')
_module='gcsfs'
pkgver='0.4.0'
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
sha256sums=('3a8981f4bba84f246c407ddff16491b8662e14bdaa106896c148828bb3373e72')

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    pytest
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
