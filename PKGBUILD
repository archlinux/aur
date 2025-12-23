# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit='17ce6fe54c1ea4f500f26636bd22058fce2ce61a'
pkgname='mquickjs'
pkgver='2025.12.22'
pkgrel='1'
pkgdesc="MicroQuickJS (aka. MQuickJS) is a Javascript engine targetted at embedded systems"
url="https://github.com/bellard/${pkgname}"
license=('MIT')
arch=('armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
depends=('glibc')
makedepends=('git')
source=("${pkgname}::git+https://github.com/bellard/${pkgname}.git#commit=${_commit}")
sha256sums=('68cf2cafaf0188dd88aa483a53b510c6b70a2fb291f4d911338101f30b92c3d3')

build() {
  cd "${pkgname}"
  make
}

package() {
  # binary
  install -D -m755 "${srcdir}/${pkgname}/mqjs" \
    "${pkgdir}/usr/bin/mqjs"

  # license
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
