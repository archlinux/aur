# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-gcsfs')
_module='gcsfs'
pkgver='0.1.0'
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
sha256sums=('9a54ae1915e22c34355a191311a36a3f487ac75906aef740059bbb734b350dfd')

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    pytest
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
