# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="itex2mml"
pkgname="${_pkgname}-bin"
pkgver=1.6.1
pkgrel=2
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
sha256sums=('3ef2572aa3421cf4d12321905c9c3f6b68911c3c9283483b7a554007010be55f')

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README"   "${pkgdir}/usr/share/doc/${_pkgname}/README"

  cd "itex-binaries/Linux"
  install -vDm755 "itex2MML" "${pkgdir}/usr/bin/itex2MML"
}
