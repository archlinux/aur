# Maintainer: Yen Chi Hsuan <yan12125 at gmail dot com>

_pkgname=python-hashpumpy
pkgname=$_pkgname-git
_github_addr=bwall/HashPump
pkgver=v1.2.0.r2.g484c538
pkgrel=1
pkgdesc=" A tool to exploit the hash length extension attack in various hashing algorithms"
arch=("i686" "x86_64")
url="https://github.com/$_github_addr"
license=('MIT')
makedepends=('git')
depends=('openssl')
provides=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/$_github_addr")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --skip-build --root="${pkgdir}"
}

