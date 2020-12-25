# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>

pkgname=python-rebulk
_name=${pkgname#python-}
pkgver=3.0.1
pkgrel=1
pkgdesc="Define simple search patterns in bulk to perform advanced matching on any string. "
arch=("any")
url="https://github.com/Toilal/rebulk"
license=('MIT')
depends=(
  'python'
  'python-six'
)
optdepends=(
  'python-regex'
)

makedepends=(
  'python-setuptools'
)
options=(!emptydirs)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
#source=("rebulk-${pkgver}.tar.gz::https://github.com/Toilal/rebulk/archive/v${pkgver}.tar.gz")

sha512sums=('a1e3ed157b262a2bbe214a01a0959372989eb354dae8ac185b2142564f7ec41e20e2e6e380f85aef14679b42d2d6a54a37076c0ebe47da2444ac2f71bcded9db')

check() {
  cd "${srcdir}/rebulk-${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}/rebulk-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
