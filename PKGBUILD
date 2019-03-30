# Maintainer: redfish <redfish@galactica.pw>

pkgname=python-merkletools
_pkgname=merkletools
_reponame=pymerkletools
pkgver=1.0.3
pkgrel=1
pkgdesc='Python tools for creating and verifying Merkle trees and proofs'
arch=('any')
url="https://github.com/Tierion/pymerkletools"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
#source=("https://github.com/Tierion/${_reponame}/archive/${pkver}.tar.gz")

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

sha256sums=('346dd10f3c11a8be5045cc3d9089f8d9315c9841deb5c71acfac031a7599b15d')
