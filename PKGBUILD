# vim: set ft=sh ts=4 sw=4 sts=4 et:
# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>

_name=click-completion
pkgname=python-click-completion
pkgver=0.2.1
pkgrel=1
pkgdesc='Fish, Bash, Zsh, and PowerShell completion for Click.'
arch=(any)
url='https://github.com/click-contrib/click-completion'
license=(MIT)
depends=(python python-click python-jinja)
makedepends=(python-setuptools)
source=("https://github.com/click-contrib/${_name}/archive/${pkgver}.tar.gz")
md5sums=(68b1261ab229145dc5d0ec685d137aad)

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install -O1 --skip-build --prefix=/usr --root="${pkgdir}"
}
