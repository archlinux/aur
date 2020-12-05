# Maintainer: Bartosz Nowak <mail at bnowak dot net>

_pkgbase=webvtt-py
pkgname=python-webvtt-py
pkgver=0.4.6
pkgrel=1
pkgdesc="Read, write and segment WebVTT caption files in Python"
arch=('any')
url="https://github.com/glut23/webvtt-py"
license=('MIT')
depends=('python-docopt')
makedepends=('python-setuptools')
source=("${_pkgbase}-${pkgver}.tar.gz::https://github.com/glut23/${_pkgbase}/archive/${pkgver}.tar.gz")
sha512sums=('aca4420ab4816a1a2568e8b41f306eff4df0fd1bea7929655f02ffd393ed5a5edde27d708c4189bc4401d59b2482fb7ec25fc19b8aa2ee1dcf12233c78a1d282')

build() {
    cd "${_pkgbase}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgbase}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
