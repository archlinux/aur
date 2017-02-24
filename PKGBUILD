# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

_pkgname=androidscreencast
pkgname=${_pkgname}-bin
pkgver=0.3.1
pkgrel=2
pkgdesc='Desktop app to control an android device remotely using mouse and keyboard'
url='https://code.google.com/archive/p/androidscreencast'
license=('Apache')
arch=('any')
depends=('icedtea-web')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${_pkgname}/${_pkgname}-${pkgver//./_}.jnlp"
        'androidscreencast'
)
sha256sums=('bf5a26b0341fc9890c2d4dcc37d9e68249889631301e671e80643a472de0cb37'
            '563d9196f7758ac2099c8863d53f5c0566b558a8934ae9d98cecfe5b71b33a2d')

package() {
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/local/lib/java"

  install -m 644 "${srcdir}/${_pkgname}-${pkgver//./_}.jnlp" "${pkgdir}/usr/local/lib/java/${_pkgname}.jnlp"
  install -m 755 "${srcdir}/androidscreencast" "${pkgdir}/usr/bin"
}
