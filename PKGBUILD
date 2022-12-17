# Maintainer: Stick <stick@stma.is>

pkgname=scalafmt
pkgver=3.6.1
pkgrel=2
pkgdesc="code formatter for the Scala programming language"
arch=('any')
url="https://scalameta.org/scalafmt/"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('coursier')

build() {
  coursier \
    bootstrap org.scalameta:scalafmt-cli_2.13:"${pkgver}" \
    -r bintray:scalameta/maven \
    -o "${srcdir}/scalafmt.bin" \
    --standalone \
    --force \
    --main org.scalafmt.cli.Cli
}

package() {
  install -Dm755 "${srcdir}/scalafmt.bin" "${pkgdir}/usr/bin/scalafmt"
}




