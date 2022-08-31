# Maitainer: a821
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-versioneer
_name=${pkgname#python-}
pkgver=0.24
pkgrel=1
pkgdesc='Easy VCS-based management of project version strings'
url="https://github.com/$pkgname/$pkgname"
depends=('python-setuptools')
optdepends=('python-cx-freeze: Executable generation support')
license=('custom:CC0')
arch=(any)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('1b8dba9e51e2f0e04c7e8545216eecdea2d63e1bd5569448ee66c549f7e7782f')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: set ts=4 sw=4 et:
