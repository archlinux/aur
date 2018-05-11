# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=python-scci
pkgname=${_pkgname}-git
pkgver=r20.3254847
pkgrel=1
pkgdesc="Syndace's Common Crypto-Interfaces"
url='https://github.com/Syndace/python-scci'
license=('MIT')
arch=('any')
depends=('python-pynacl')
makedepends=('python-setuptools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/Syndace/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_pkgname}"
    python3 setup.py install --root="${pkgdir}" --optimize=1
}
