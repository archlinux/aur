# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-gcsfs'
_module='gcsfs'
pkgver='2023.6.0'
pkgrel=1
pkgdesc="Pythonic file-system interface for Google Cloud Storage."
url="http://gcsfs.readthedocs.io/en/latest/"
#checkdepends=('docker' 'python-pytest' 'python-pytest-timeout' 'python-vcrpy')
depends=('python' 'python-fsspec>=0.6.0' 'python-google-auth'
    'python-google-auth-oauthlib'
    'python-requests' 'python-decorator')
makedepends=('python-setuptools')
optdepends=()
license=('BSD')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dask/gcsfs/archive/$pkgver.tar.gz")
sha256sums=('b2dc7641a4ef121cfa08805448839d17125c9af05e9dfe8bee13470a7040c994')

#check() {
    #cd "${_module}-${pkgver}"
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
