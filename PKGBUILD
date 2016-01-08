# Maintainer: Romain Gautier <romain dot gautier at nimamoh dot com>
pkgname=kotlinc
pkgver=1.0.0_beta
pkgrel=4584
pkgdesc="Kotlin compiler"
arch=('any')
url="https://github.com/JetBrains/kotlin/releases/tag/build-1.0.0-beta-4584"
license=('apache')
groups=()
depends=('java-environment>=6' 'bash')

source=("https://github.com/JetBrains/kotlin/releases/download/build-1.0.0-beta-4584/kotlin-compiler-1.0.0-beta-4584.zip")
sha256sums=("191698784f4a1f769df14757bad40243293aa6bc3d8e906bfa0c80c3db0a1d2c")

package() {
  cd "$srcdir"

  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  cp -R "${srcdir}/kotlinc/"* "${pkgdir}/opt/${pkgname}"

  ln -s "/opt/kotlinc/bin/kotlinc" "${pkgdir}/usr/bin"
  ln -s "/opt/kotlinc/bin/kotlinc-jvm" "${pkgdir}/usr/bin"
  ln -s "/opt/kotlinc/bin/kotlinc-js" "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:&
