# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.0.2
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('7857df779cbb37acfff8d98bb3e46d26a3c1f0fdd653b8cffade6637a74bfbe1433489b87e67a676bf378c4fdb3534232484fef25b485572d03ed568435136cf')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
