# Maintainer: Matthias Mailänder <matthias@mailaender.name>

pkgbase='python-igdb-api'
pkgname=('python-igdb-api')
_module='igdb-api-python'
pkgver='0.3.3'
pkgrel=1
pkgdesc="Python wrapper for Internet Game Database API"
url="https://github.com/twitchtv/igdb-api-python"
depends=('python' 'python-requests' 'python-protobuf')
makedepends=('python-build' 'python-installer' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/twitchtv/igdb-api-python/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1842adee4f4c4eddb30e8907353c5915387528f08b396f1ce09eb01c4bf29059')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    export VERSION=$pkgver
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
