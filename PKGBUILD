# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Joris Steyn <jorissteyn@gmail.com>
# Please report issues at https://github.com/sanduhrs/arch-aur-phploc

pkgname=phploc
pkgver=7.0.0
pkgrel=1
pkgdesc="A tool for quickly measuring the size of a PHP project"
url="https://github.com/sebastianbergmann/phploc"
arch=("any")
license=("BSD")
depends=("php")
source=("https://phar.phpunit.de/${pkgname}-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/${pkgname}/${pkgver}/LICENSE")
sha512sums=('e159d8335aee997f0b94464434a225c944ccf23ddb591c1557d364c6dbdfcd2b8bba5d77b67410a9672ebf02a9119895932ae4edb2b0143f1f8ac1f71699dc45'
            '01b3d9272d9677c3f3a90d8eeb1409909d6ea48d87430c98a78b2ddd2f1949888a9de80bc210fcc98420d0dcfa11ca1a0bd0a8fc03def4639703061ea583c1be')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
