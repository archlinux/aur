# Maintainer: Nichlas Severinsen <ns@nsz.no>
pkgname=cantaloupe
provides=('cantaloupe')
conflicts=('cantaloupe')
pkgver=5.0.5
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
  '241a5ed6e3bbc69a62d4ccd5d59069e4cad44b665d91c378ad41338e8beaf311'
  'c07c4de8512dd32bc6c2e5b810c428a3f5d4f10e39ca5de63d8a679aa4fe3f20'
  'f8494ff940841e7b897b22d680e4bf87baf8fb1d6ced87117538dd5abaa1fc34'
  'f8d04dd2e3ebe8950b6eca7c140f34cc9690e6224351c170042bb06eaa729dc3'
)

package() {
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}.properties" "${pkgdir}/usr/share/${pkgname}/${pkgname}.properties"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
