# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

_pkgname=androidscreencast
pkgname=${_pkgname}-bin
pkgver=0.3.1
pkgrel=1
pkgdesc='Desktop app to control an android device remotely using mouse and keyboard'
url='https://code.google.com/archive/p/androidscreencast'
license=('Apache')
arch=('any')
depends=('icedtea-web')
source=(
  "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${_pkgname}/${_pkgname}-${pkgver//./_}.jnlp"
  'androidscreencast'
)
md5sums=(
  '7a2c2f22d6e96b8266718b39f48d7dc5'
  'ddbde6521d02a59f71c13d47d85a32d4'
)

package() {
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/local/lib/java"

  install -m 644 "${srcdir}/${_pkgname}-${pkgver//./_}.jnlp" "${pkgdir}/usr/local/lib/java/${_pkgname}.jnlp"
  install -m 755 "${srcdir}/androidscreencast" "${pkgdir}/usr/bin"
}
