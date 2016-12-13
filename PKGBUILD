# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
_github_url=https://github.com/kmike/port-for
pkgname=python-port-for
pkgver=0.3.1
pkgrel=2
pkgdesc="Utility that helps with local TCP ports managment. It can find an unused TCP localhost port and remember the association."
arch=('any')
url="${_github_url}"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
conflicts=('python2-port-for')
source=(${pkgname}::git+${_github_url}.git#tag=$pkgver)
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"

    python setup.py install --skip-build --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 et:
