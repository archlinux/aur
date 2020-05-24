# Maintainer: Bartosz Nowak <mail at bnowak dot net>

_pkgbase=webvtt-py
pkgname=python-webvtt-py
pkgver=0.4.5
pkgrel=1
pkgdesc="Read, write and segment WebVTT caption files in Python"
arch=('any')
url="https://github.com/glut23/webvtt-py"
license=('MIT')
depends=('python-docopt')
makedepends=('python-setuptools')
source=("${_pkgbase}-${pkgver}.tar.gz::https://github.com/glut23/${_pkgbase}/archive/${pkgver}.tar.gz")
sha512sums=('f14202537360bc504414d2771bcecfab9fcfd3c2c60b328ebe403ef2eaf95f3252953601d8c6800874d574f4492ffc385b13d73b63d1ddaea341caf9823f28a0')

build() {
    cd "${_pkgbase}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgbase}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
