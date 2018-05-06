# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=scalafmt
pkgver=1.5.1
pkgrel=1
pkgdesc="code formatter for the Scala programming language"
arch=(any)
url="https://olafurpg.github.io/scalafmt/"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('coursier')

package() {
  # shellcheck disable=2154
  mkdir -p "$pkgdir"/usr/bin

  coursier \
    bootstrap com.geirsson:scalafmt-cli_2.12:"$pkgver" \
    -r bintray:scalameta/maven \
    -o "$pkgdir"/usr/bin/scalafmt \
    --standalone \
    --main org.scalafmt.cli.Cli
}
