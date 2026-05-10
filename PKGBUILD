# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="itex2mml"
pkgname="${_pkgname}-bin"
pkgver=1.6.2
pkgrel=1
pkgdesc="iTeX to MathML converter"
arch=(
  'x86_64'
)
url="https://golem.ph.utexas.edu/~distler/blog/itex2MML.html"
license=(
  'GPL-2.0-or-later OR LGPL-2.0-or-later OR MPL-1.1'
)
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
)
_pkgsrc="itexToMML"
source=(
  "https://golem.ph.utexas.edu/~distler/blog/files/itexToMML-${pkgver}.tar.gz"
)
sha256sums=('8af5a7443df87f74e0cdf2bce27dd78396566cbcffaf15efe1e87325fa6b15d3')

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README"   "${pkgdir}/usr/share/doc/${_pkgname}/README"

  cd "itex-binaries/Linux"
  install -vDm755 "itex2MML" "${pkgdir}/usr/bin/itex2MML"
}
