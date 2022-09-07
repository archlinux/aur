# Maitainer: a821
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-versioneer
_name=${pkgname#python-}
pkgver=0.26
pkgrel=1
pkgdesc='Easy VCS-based management of project version strings'
url="https://github.com/$pkgname/$pkgname"
depends=('python-setuptools')
optdepends=('python-cx-freeze: Executable generation support')
license=('custom:CC0')
arch=(any)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('84fc729aa296d1d26645a8f62f178019885ff6f9a1073b29a4a228270ac5257b')

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
