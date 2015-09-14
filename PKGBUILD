# Maintainer: Romain Gautier <romain dot gautier at nimamoh dot com>
pkgname=kotlinc
pkgver=0.12.613
pkgrel=1
pkgdesc="Kotlin compiler"
arch=('any')
url="https://github.com/JetBrains/kotlin/releases/tag/build-0.12.613"
license=('Apache License, Version 2.0')
groups=()
depends=('java-environment>=6')

source=("https://github.com/JetBrains/kotlin/releases/download/build-0.12.613/kotlin-compiler-0.12.613.zip")
sha256sums=("e72b02661d8d995f51dec9c3d63b901d13a451c1d2a99faf7b9b9ab4e3ef87f5")

package() {
  cd "$srcdir"

  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  cp -R "${srcdir}/kotlinc/"* "${pkgdir}/opt/${pkgname}"

  ln -s "${srcdir}/kotlinc/bin/kotlinc" "${pkgdir}/usr/bin/"
  ln -s "${srcdir}/kotlinc/bin/kotlinc-jvm" "${pkgdir}/usr/bin/"
  ln -s "${srcdir}/kotlinc/bin/kotlinc-js" "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
