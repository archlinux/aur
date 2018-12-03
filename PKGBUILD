# Maintainer: csicar

pkgname=key-bin
pkgver=2.6.3
pkgrel=2
pkgdesc="Java Software Verification Tool"
arch=(any)
url="https://www.key-project.org/"
license=('GPL')
depends=("java-runtime")
optdepends=("z3")
source=("https://formal.iti.kit.edu/key/releases/2.6.3/key-2.6.3_7d3deab0763c88edee4f7a08e604661e0dbdd450.zip"
        "key.desktop"
        "key.sh")
sha256sums=('b7b8373b91b915bbace69a880e47f27b9c6e72f3d852907ec64e645f663e8211'
            '883e62e3dd9d9c164e9e7c5199333409937a7591c1b17003dbb04beec7c27980'
            '449a4874434aabc061ba713a96966e1d6baa524f4e5c8b140cf03985c3b60b43')

build() {
  ls
  # assume ant defaults to UTF8 encoding.
}

package() {
  install -m 755 -D "key.sh" "$pkgdir/usr/bin/key"

  mkdir -p "${pkgdir}/usr/share/java/key"

  cp -a libs "${pkgdir}/usr/share/java/key/libs"
  cp -a components "${pkgdir}/usr/share/java/key/components"
  cp KeY.jar "${pkgdir}/usr/share/java/key/KeY.jar"

  install -Dm755 "${srcdir}/key.desktop" "${pkgdir}/usr/share/applications/key.desktop"

  ls "${pkgdir}/usr/share/java/key"
}
