# Maintainer: csicar

pkgname=key-nightly
pkgver=2.7.1537
pkgrel=1
pkgdesc="Java Software Verification Tool"
arch=(any)
url="https://www.key-project.org/"
license=('GPL')
depends=("java-runtime")
optdepends=("z3")
conflicts=("key-bin")
source=("https://formal.iti.kit.edu/key/download/nightly/dist/key-2.7.1537_6449d9d989e94bc1fbb235e3c06b45ac1e0d9af6-exe.jar"
	"https://www.key-project.org/wp-content/themes/key/img/key-logo-white.png"
        "key.desktop"
        "key.sh")
sha256sums=('82bce336de5700a7283f71680f39479ac1f32d63e85402fc3e0df3bbe6b6b861'
	    '6b3f7a6d75515e92a9f139216c59c06bd9b43da62e70904eef882722ce7cceae'
            '883e62e3dd9d9c164e9e7c5199333409937a7591c1b17003dbb04beec7c27980'
            '449a4874434aabc061ba713a96966e1d6baa524f4e5c8b140cf03985c3b60b43')

build() {
  ls
  # assume ant defaults to UTF8 encoding.
}

package() {
  install -m 755 -D "key.sh" "$pkgdir/usr/bin/key"

  mkdir -p "${pkgdir}/usr/share/java/key"
  mkdir -p "${pkgdir}/usr/share/icons/"

  cp key*-exe.jar "${pkgdir}/usr/share/java/key/KeY.jar"

  cp key-logo-white.png "${pkgdir}/usr/share/icons/key.png"

  install -Dm755 "${srcdir}/key.desktop" "${pkgdir}/usr/share/applications/key.desktop"

  ls "${pkgdir}/usr/share/java/key"
}
