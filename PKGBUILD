# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>
pkgname=python-rply-git
_gitname=rply
pkgver=v0.7.6.r1.gb8bf6b1
pkgrel=1
pkgdesc="A pure Python Lex/Yacc that works with RPython"
arch=('any')
url="https://pypi.python.org/pypi/rply"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
provides=('python-rply')
conflicts=('python-rply')
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
