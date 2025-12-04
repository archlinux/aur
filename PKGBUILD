# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=jdtls
pkgver=1.54.0
pkgrel=1
pkgdesc="Eclipse Java language server"
arch=(any)
url="https://github.com/eclipse/eclipse.jdt.ls"
license=('EPL-2.0')
depends=('java-runtime>=21')
optdepends=('python: for the official launcher script')
makedepends=()
source=("https://download.eclipse.org/jdtls/milestones/1.54.0/jdt-language-server-1.54.0-202511261751.tar.gz")
sha256sums=('1a291a269bd88b3c4048219122961a52ec80872afbc7a3f34270b2ce77f7a14c')

package() {
  mkdir -p "${pkgdir}/usr/share/java/jdtls"
  cp -R "${srcdir}/"config_* "${srcdir}/features" "${srcdir}/plugins" "${srcdir}/bin" "${pkgdir}/usr/share/java/jdtls"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s --relative "${pkgdir}/usr/share/java/jdtls/bin/jdtls" "${pkgdir}/usr/bin/jdtls"
}
