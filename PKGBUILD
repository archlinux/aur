# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=1.0.3
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar"
        "https://raw.githubusercontent.com/vimeo/psalm/${pkgver}/LICENSE")
sha512sums=('2bbf62008707ea88113434adf0bdd6d999ecd1b85a020de0106e1f4c5b34a143b0aad7a6654868ca6615368fcb6297892e89e66d65e7b5158a871d2a2de5e602'
        	'52ea0511bb755c9dbb276eb16dff73e91638d8636a6ded41c91aa2d85139f4db69a40691aa13898b7e2946b368ab3cc851417a9a6d6688a4e879a1d8c407a431')

package() {
  install -D -m 644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}