# Maintainer: Marc Straube <m.straube@skunk-coding.de>
# Contributor: Stefan Auditor <stefan.auditor@erdfisch.de>

pkgname='phpdox'
pkgver='0.8.1.1'
pkgrel=3
pkgdesc="Documentation generator for PHP Code using standard technology (SRC, DOCBLOCK, XML and XSLT)"
url="http://phpdox.de"
license=('BSD')
install="${pkgname}.install"
arch=('any')
depends=('php>=5.3.3' 'php-xsl')
source=("https://github.com/theseer/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.phar"
        "https://raw.githubusercontent.com/theseer/${pkgname}/${pkgver}/LICENSE"
        "${pkgname}.install")
sha512sums=('9355bafa1006c72ec97b8e8f2f0e5191604b5d43b583e80b08d72efc47b537cce0cb95e2b33180948072c55e8097974ffd3a4da6c21849a62194c700f8718d2b'
            '61e052222ec37de300fe3013c1f58ac8c877df58f529f87eca99e516b8d207d0a588376746e3f14262bfa853ac9e53dc937de3456372cb6159274cfb729cde7c'
            '34b1a537518619ce3332d176117251f60b02bb73638e32f479a1f8087385dbf6ed73a537505c795aa54790727ca29ea830cabe1d48339fcb7bfee3e339b121d1')
package() {
  cd "${srcdir}"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
