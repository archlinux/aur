# Maintainer: SeineEloquenz alexander minus linder at gmx dot de

pkgname=key-exe-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="Java Software Verification Tool"
arch=(any)
url="https://www.key-project.org/"
license=('GPL')
depends=("java-runtime")
optdepends=("z3: z3 solver support"
            "yices: yices solver support")
source=("https://www.key-project.org/dist/${pkgver}/key-${pkgver}-exe.jar"
        "key-logo-white.png"
        "key.desktop"
        "key.sh")
noextract=('key-${pkgver}-exe.jar')
sha256sums=('65b1a6d1c21df993c23e781c661d8b6f9efd07050aed0c2ca224575772e6bdb1'
            '4528428a6d47de78ca395de5be6102816ffe0a94ab168b3ecb35f9aa440b230e'
            '5b56b4146777dbbdd4b6564b948bb3f0553cd99a47c8a74034905ffa5cf1af9f'
            '3917522c185e4077b5225af7264791cca4c51c82dc4150e803b4c8c105b9d302')

build() {
  ls
  # assume ant defaults to UTF8 encoding.
}

package() {
  install -m 755 -D "key.sh" "$pkgdir/usr/bin/key"

  mkdir -p "${pkgdir}/usr/share/java/key"
  mkdir -p "${pkgdir}/usr/share/icons/"

  cp key-2.8.0-exe.jar "${pkgdir}/usr/share/java/key/KeY.jar"

  cp key-logo-white.png "${pkgdir}/usr/share/icons/key.png"

  install -Dm755 "${srcdir}/key.desktop" "${pkgdir}/usr/share/applications/key.desktop"

  ls "${pkgdir}/usr/share/java/key"
}
