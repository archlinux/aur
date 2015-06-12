# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>
pkgname=python-rply-git
_gitname=rply
pkgver=v0.7.3.r3.g700daa7
pkgrel=1
pkgdesc="A pure Python Lex/Yacc that works with RPython"
arch=('any')
url="https://pypi.python.org/pypi/rply"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
provides=('python-rply')
source=("git+https://github.com/alex/rply.git")
md5sums=("SKIP")

pkgver() {
    cd "${_gitname}"
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "${_gitname}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
