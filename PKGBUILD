# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=stegsolve
pkgver=1.3
pkgrel=3
pkgdesc="A steganographic image analyzer, solver and data extractor for challanges"
url="https://www.wechall.net/de/forum/show/thread/527/Stegsolve_1.3/"
arch=('any')
license=('unknown')
depends=('java-runtime' 'sh')
source=(${pkgname}-${pkgver}.jar::http://www.caesum.com/handbook/Stegsolve.jar)
noextract=("${pkgname}-${pkgver}.jar")
sha512sums=('1bb0d4a6c0787381045b4ff28a9feafe548b29e105bef1f91ce38d244fda75c3e3b51c55b619da4f4d3ddc264f58a41194128f40a6eb54a0c3928cf6cc3f6b7e')

build() {
  cat > ${pkgname} <<EOF
#!/bin/sh
"\$JAVA_HOME/bin/java" -jar "/usr/share/java/${pkgname}/${pkgname}.jar"
EOF
}

package() {
  install -Dm 644 ${pkgname}-${pkgver}.jar "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -Dm 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}

# vim: ts=2 sw=2 et:
