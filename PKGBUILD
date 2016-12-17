# vim: set ft=sh ts=4 sw=4 sts=4 et:
# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>

_name=click-didyoumean
pkgname=python-click-completion
pkgver=0.0.3
pkgrel=1
pkgdesc='Enable git-like did-you-mean feature in Click.'
arch=(any)
url='https://github.com/click-contrib/click-didyoumean'
license=(MIT)
depends=(python python-click)
makedepends=(python-setuptools)
source=("https://github.com/click-contrib/${_name}/archive/v${pkgver}.tar.gz")
md5sums=(8f7e39fe489aeb124263af4641b243f0)

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install -O1 --skip-build --prefix=/usr --root="${pkgdir}"
}

