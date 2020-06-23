# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.12.1
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('1134e058863f9fb36c9aff4551bcdab74abe6b71ac567ff498ad27f9166bb45a2781b630cad90527b6e7a5b9de953949e95940826424a0ed0bd5f93a91db9976')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
