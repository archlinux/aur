# Maintainer: Justin ! <just1602@riseup.net>

pkgname='mtail'
_pkgver=3.0.0-rc62
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc='extract whitebox monitoring data from application logs for collection in a timeseries database'
arch=('x86_64')
url='https://github.com/google/mtail'
license=('Apache')
makedepends=('git' 'go')
conflicts=("${pkgname}")
source=("git+https://github.com/google/mtail#tag=v${_pkgver}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"

  make
}

check() {
  cd "${pkgname}"

  make test
}

package() {
  cd "${pkgname}"

  install -Dm755 "mtail" "${pkgdir}/usr/bin/mtail"
  install -Dm755 "mfmt" "${pkgdir}/usr/bin/mfmt"
  install -Dm755 "mdot" "${pkgdir}/usr/bin/mdot"
  install -Dm755 "mgen" "${pkgdir}/usr/bin/mgen"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
