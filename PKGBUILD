# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=2.0.1
pkgrel=2
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('f0d91c251f7b62f039c1cad6627960e4c1c46ba3067ae30eabae5613e822d982f7907f72f4369e04f4a192a479c600c2fd18a9910c04e06aa0ca8decdf997433')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
