# Maitainer: a821
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-versioneer
_name=${pkgname#python-}
pkgver=0.21
pkgrel=1
pkgdesc='Easy VCS-based management of project version strings'
url="https://github.com/$pkgname/$pkgname"
depends=('python-setuptools')
optdepends=('python-cx-freeze: Executable generation support')
license=('custom:Public Domain')
arch=(any)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('64f2dbcbbed15f9a6da2b85f643997db729cf496cafdb97670fb2fa73a7d8e20')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
}

# vim: set ts=4 sw=4 et:
