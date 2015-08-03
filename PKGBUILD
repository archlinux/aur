# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=apache-opennlp
pkgver=1.6.0
pkgrel=1
pkgdesc="A machine learning based toolkit for the processing of natural language text"
arch=(any)
url="http://opennlp.apache.org/"
license=('APACHE')
depends=(java-environment bash)

source=(http://www.apache.org/dist//opennlp/opennlp-${pkgver}/${pkgname}-${pkgver}-bin.tar.gz)
md5sums=('8fe90ccaf9b2ea16767893342e4c53ee')
sha512sums=('0dd18f0efcf1cf0213da10c32f2dbbaddc163031e68a7167b1cc24c73d2fd11ee6b564f7a9cf1d4e405723a798992b67ed7a92f7882b068c84e516f32097e477')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/doc/opennlp"
  mkdir -p "${pkgdir}/usr/lib/opennlp"

  sed "s/HOME\/lib\/opennlp/HOME\/lib\/opennlp\/opennlp/g" < "${srcdir}/${pkgname}-${pkgver}/bin/opennlp" > "${pkgdir}/usr/bin/opennlp"
  cp "${srcdir}/${pkgname}-${pkgver}/RELEASE_NOTES.html" "${pkgdir}/usr/share/doc/opennlp"
  cp -r "${srcdir}/${pkgname}-${pkgver}/docs/"* "${pkgdir}/usr/share/doc/opennlp"
  cp -r "${srcdir}/${pkgname}-${pkgver}/lib/"* "${pkgdir}/usr/lib/opennlp"
  chmod +x "${pkgdir}/usr/bin/opennlp"
}
