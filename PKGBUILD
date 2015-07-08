# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
#
# namcap warns that python2 is an unnecessary dependency. This is untrue.

pkgname=python2-factory_boy
_pkgname="${pkgname#python2-}"
pkgver=2.5.2
pkgrel=1
pkgdesc="A fixtures replacement based on thoughtbot's factory_girl for Ruby."
arch=(any)
url='https://github.com/rbarrois/factory_boy'
license=(MIT)
depends=(python2)
makedepends=(python2-distribute)
options=(!emptydirs)
source=(
  "https://pypi.python.org/packages/source/f/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
  LICENSE
)

sha256sums=('cd8306e64c3a115deca136685e945db88ffe171382012ec938ed241a20dd7eba'
            'a57c71972eb450d03a3ef6eb8ae32bcdb9fcc485c11c52ee1032a2b0c107f714')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 \
    "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
