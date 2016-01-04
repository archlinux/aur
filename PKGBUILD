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
            'a47a6cad4e6cf2bf4576d2798231d42976ad24b6201838d0b261adfac93a31681c09d2a0e46f5ea471e6abf7efed70d4268b024a64fd8f3f33578b4fcd9910b1')
package() {
  cd "${srcdir}"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
