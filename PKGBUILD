# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>
pkgname=hy-git
_gitname=hy
pkgver=0.14.0.r16.gc1e5c3e
pkgrel=1
pkgdesc="Python <--> Lisp layer"
arch=('any')
url="http://hylang.org/"
license=('MIT')
depends=('python' 'python-rply' 'python-astor' 'python-clint' 'python-args' 'python-setuptools')
conflicts=('hy')
provides=('hy')
options=(!emptydirs)
source=("git://github.com/hylang/hy.git")
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
