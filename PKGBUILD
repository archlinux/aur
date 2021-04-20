# Maintainer: csicar

pkgname=key-bin
_pkgname=key
pkgver=2.8.0
pkgrel=0
pkgdesc="Java Software Verification Tool"
arch=(any)
url="https://www.key-project.org/"
license=('GPL')
depends=("java-runtime")
optdepends=("z3")
source=("https://www.key-project.org/dist/${pkgver}/key-${pkgver}.zip"
        "https://www.key-project.org/wp-content/themes/key/img/key-logo-white.png"
        "key.desktop")
sha256sums=('40c364a979086052db1443d835fca41d1d85073516d9e3c4d212966e5e449de7'
            '6b3f7a6d75515e92a9f139216c59c06bd9b43da62e70904eef882722ce7cceae'
            '883e62e3dd9d9c164e9e7c5199333409937a7591c1b17003dbb04beec7c27980')

package() {
  mkdir -p "${pkgdir}/usr/share/java/key"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/icons/"

  cp -a "$_pkgname-$pkgver/lib" "${pkgdir}/usr/share/java/key/lib"
  cp -a "$_pkgname-$pkgver/bin" "${pkgdir}/usr/share/java/key/bin"
  ln -s "${pkgdir}/usr/share/java/key/bin/key.ui" "${pkgdir}/usr/bin/key"

  cp key-logo-white.png "${pkgdir}/usr/share/icons/key.png"

  install -Dm755 "${srcdir}/key.desktop" "${pkgdir}/usr/share/applications/key.desktop"
}
