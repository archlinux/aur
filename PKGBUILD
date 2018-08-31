# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-gcsfs')
_module='gcsfs'
pkgver='0.1.2'
pkgrel=1
pkgdesc="Pythonic file-system interface for Google Cloud Storage."
url="http://gcsfs.readthedocs.io/en/latest/"
checkdepends=('python-pytest' 'python-vcrpy')
depends=('python' 'python-google-auth'
    'python-google-auth-oauthlib'
    'python-requests' 'python-decorator')
makedepends=()
optdepends=()
license=('BSD')
arch=('any')
source=("https://github.com/dask/gcsfs/archive/$pkgver.tar.gz")
sha256sums=('328cf585d9956a4c2f48cd3cc8792a89d5da16339975b242754cb6a29671f6a1')

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    pytest
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
