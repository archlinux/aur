# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Patrick Burroughs <celticmadman at gmail dot com>

_pkgname=tzlocal
pkgname=python-${_pkgname}
pkgver=1.3
pkgrel=1
pkgdesc="Tzinfo object for the local timezone"
arch=('any')
url='https://pypi.python.org/pypi/tzlocal'
license=('custom')
depends=('python-pytz')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/regebro/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ed77c6c272cecca220fce830091ec6468b677b984e1b2f1f1cfc40729728b288')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
