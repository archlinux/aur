# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=python-scci
_pkgname2=python2-scci
pkgbase=${_pkgname}-git
pkgname=("${_pkgname}-git" "${_pkgname2}-git")
pkgver=r20.3254847
pkgrel=2
pkgdesc="Syndace's Common Crypto-Interfaces"
url='https://github.com/Syndace/python-scci'
license=('MIT')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${_pkgname}::git+https://github.com/Syndace/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_python-scci-git() {
    depends=('python-pynacl')
    provides=("${_pkgname}")
    conflicts=("${_pkgname}")

    cd "${_pkgname}"
    python3 setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-scci-git() {
    depends=('python2-pynacl')
    provides=("${_pkgname}")
    conflicts=("${_pkgname}")

    cd "${_pkgname}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
