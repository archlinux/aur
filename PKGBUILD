# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="hurst"
pkgver=20241219
pkgrel=1
pkgdesc="Rescaled range analysis: Hurst exponents"
arch=('x86_64')
url="https://members.tripod.com/professor_tom/archives/index.html"
license=('custom:Unknown')
depends=('glibc')
_pkgsrc="${pkgname}-${pkgver}"
source=("${pkgname}.c::https://members.tripod.com/professor_tom/archives/${pkgname}.c")
sha256sums=('6df12018bae618279a83d1b9a3d96b6d872ebbcafefe52902c10e858a324d028')

pkgver() {
  date +%Y%m%d
}

build() {
  cd "${srcdir}"
  gcc ${CFLAGS} ${LDFLAGS} -o "${_pkgsrc}" "${pkgname}.c" -lm
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}" "${pkgdir}/usr/bin/${pkgname}"
}
