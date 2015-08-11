# Maintainer: Marc Straube <m.straube@skunk-coding.de>>

pkgname='phpdox'
pkgver='0.8.1.1'
pkgrel=1
pkgdesc="Documentation generator for PHP Code using standard technology (SRC, DOCBLOCK, XML and XSLT)"
url="http://phpdox.de"
license=('custom')
install="${pkgname}.install"
arch=('any')
depends=('php>=5.3.3' 'php-xsl')
source=("https://github.com/theseer/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.phar"
	'LICENSE')
sha256sums=('1424d4603e0fdb0c80e39266fb832060bffbcc665a8c8d29b411e88d096d5da2'
            'b9f0017ad3f5fcb80fd561870543fe92ac89a65dbd14e759f6be93b25670250a')

package() {
  cd "${srcdir}"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
