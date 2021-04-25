# Maintainer: Diego Nieto Cid <dnietoc@gmail.com>

pkgname="python-github3.py"
pkgver="2.0.0"
pkgrel=1
pkgdesc="A comprehensive wrapper around the GitHub API (v3)"
arch=("any")
url="https://github.com/sigmavirus24/github3.py"
license=("custom:Modified BSD")
makedepends=("python-setuptools")
depends=("python" "python-requests" "python-uritemplate" "python-dateutil" "python-jwcrypto")
source=("github3-$pkgver.tar.gz::https://github.com/sigmavirus24/github3.py/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3ee0481402d94f0737da5687e70d836b5a3dbe5567cb2d240cb0c616334a95a5')

build() {
    cd "${srcdir}/github3"
    python setup.py build
}

check() {
## TODO This needs betamax, coverage and mock as makedepends
#    cd "${srcdir}/${_module}-${pkgver}"
#    python setup.py test
    :
}

package() {
    cd "${srcdir}/github3"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
