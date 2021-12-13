# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=fontdoctools
pkgname=python-$_pipname
_sha=5f2880db5e08
pkgver=1.1
pkgrel=2
pkgdesc='tools that help in documenting and reviewing the design or the engineering of fonts'
arch=(any)
_namespace=LindenbergSW
url="https://bitbucket.org/$_namespace/$_pipname"
license=(MIT)
_py_deps=(fonttools)
depends=(python
         "${_py_deps[@]/#/python-}")
provides=(dottedcircleshaper glyphplotter glyhpsandwich glyphshaper roentgen)
makedepends=(python-setuptools)
_archive="$_namespace-$_pipname-$_sha"
source=("$_archive.zip::$url/get/$_sha.zip")
sha256sums=('ea86f79b851dc28f62c2ec3ca5824a7906ed97688b96b0170de4f1a5b455be7c')

build() {
    cd "$_archive"
    python setup.py build
}

package() {
    cd "$_archive"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
