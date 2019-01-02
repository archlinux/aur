# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.0.8
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('b07c109af60c27be7aecf1e170139e0a0211e3818f60088dda8caae2f7540b9aaa1f9f8e4395eca1bc768eb553ef5d8d0111e0feea619d3ba23be9112845f22e')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
