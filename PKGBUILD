# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Guillaume Brogi <gui-gui at netcourrier dot com>

_pkgname=progress
pkgname=python-progress
pkgver=1.6
pkgrel=5
pkgdesc="Easy to use progress bars for Python"
arch=('any')
url="https://github.com/verigak/${_pkgname}"
license=('ISC')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('e4a0d9e4370cd09f29ecdf72bf84c7177caef8374a90a627c83a84e619eb0f3d')

build() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python setup.py build
}

check() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python test_progress.py
}

package() {
    cd "${srcdir}"/${_pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
