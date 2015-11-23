# Maintainer: Romain Gautier <romain dot gautier at nimamoh dot com>
pkgname=kotlinc
pkgver=1.0.0_beta
pkgrel=2423
pkgdesc="Kotlin compiler"
arch=('any')
url="https://github.com/JetBrains/kotlin/releases/tag/beta2_%2F1.0.0-beta-2422-IJ143-12-143.379.11"
license=('apache')
groups=()
depends=('java-environment>=6' 'bash')

source=("https://github.com/JetBrains/kotlin/releases/download/build-1.0.0-beta-2423/kotlin-compiler-1.0.0-beta-2423.zip")
sha256sums=("130c7dbcaeb269e4d3e11021264e4cc6e9d202e5e54a0810ed2648da827bf3f3")

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
