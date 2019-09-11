# Maintainer: Nichlas Severinsen <ns@nsz.no>
pkgname=cantaloupe
provides=('cantaloupe')
conflicts=('cantaloupe')
pkgver=4.1.3
pkgrel=1
pkgdesc='High-performance dynamic image server in Java'
arch=('any')
license=('NCSA')
url='https://cantaloupe-project.github.io/'
depends=('java-runtime')
install=cantaloupe.install

source=(
  "cantaloupe.service"
  "cantaloupe.properties"
  "https://github.com/cantaloupe-project/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip"
  "https://raw.githubusercontent.com/cantaloupe-project/cantaloupe/develop/LICENSE.txt"
)

sha256sums=(
  '075bb3598bbddd0fbbb6134f0afa1cfa0c7dc4201e77d364e2b893aea608bc22'
  'c07c4de8512dd32bc6c2e5b810c428a3f5d4f10e39ca5de63d8a679aa4fe3f20'
  'c29a06f751b55b8a6a8adf170daa4375051e650e69f94fdd459ccbc4fb414580'
  'f8d04dd2e3ebe8950b6eca7c140f34cc9690e6224351c170042bb06eaa729dc3'
)

package() {
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.war" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.war"
  install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}.properties" "${pkgdir}/usr/share/${pkgname}/${pkgname}.properties"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
