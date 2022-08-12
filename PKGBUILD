# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>
pkgname=python-astor-git
_gitname=astor
pkgver=0.8.1.r7.ga9c5f8d
pkgrel=1
pkgdesc="Read/rewrite/write Python ASTs"
arch=('any')
url="https://pypi.python.org/pypi/astor"
license=('BSD')
depends=('python')
makedepends=('python-setuptools' 'git')
options=(!emptydirs)
conflicts=('python-astor')
provides=('python-astor')
source=("git+https://github.com/berkerpeksag/astor.git")
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

