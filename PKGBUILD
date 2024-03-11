# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

_pkgname=matrix-synapse-pam
pkgname="python-${_pkgname}"
pkgdesc="PAM auth provider for the Synapse Matrix server "
pkgver=0.1.3
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/14mRh4X0r/matrix-synapse-pam"
license=('EUPL')
depends=(
  'python'
  'python-pam'
  'python-twisted'
)

source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/14mRh4X0r/matrix-synapse-pam/archive/v${pkgver}.tar.gz"
)

sha256sums=(
  "def8f1547133ba260d4653478cea915b88048a85f3ca2d014ebcebccd1672cbc"
)

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  python setup.py install --root="${pkgdir}"
}
