# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>
pkgname=python-astor-git
_gitname=astor
pkgver=0.5.r0.ga463ac8
pkgrel=1
pkgdesc="Read/rewrite/write Python ASTs"
arch=('any')
url="https://pypi.python.org/pypi/astor"
license=('BSD')
depends=('python')
options=(!emptydirs)
source=("git://github.com/berkerpeksag/astor.git")
md5sums=("SKIP")

pkgver() {
    cd "${_gitname}"
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "${_gitname}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

