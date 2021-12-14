# Maintainer: Diego Nieto Cid <dnietoc@gmail.com>

pkgname="python-github3.py"
pkgver="3.0.0"
pkgrel=1
pkgdesc="A comprehensive wrapper around the GitHub API (v3)"
arch=("any")
url="https://github.com/sigmavirus24/github3.py"
license=("custom:Modified BSD")
makedepends=("python-setuptools")
depends=("python" "python-requests" "python-uritemplate" "python-dateutil" "python-jwcrypto")
source=("https://github.com/sigmavirus24/github3.py/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1bdd6f19d2c5756cdb017fb47828d31e77916bba0312b2726c67253a439ae61b')

build() {
    cd "github3.py-${pkgver}"
    python setup.py build
}

check() {
## TODO This needs betamax, coverage and mock as makedepends
#    cd "${srcdir}/${_module}-${pkgver}"
#    python setup.py test
    :
}

package() {
    cd "github3.py-2.0.0"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
