# Maintainer: Gonsolo <gonsolo@gmail.com>

pkgname=scalafmt
pkgver=3.10.0
pkgrel=1
pkgdesc="code formatter for the Scala programming language"
arch=('any')
url="https://github.com/scalameta/scalafmt"
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




