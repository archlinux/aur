# Maintainer: Rhys Perry <rhysperry111@gmail.com>

pkgname=komga
# AUTOMATICALLY UPDATED BY SCRIPT ON NEW RELEASE #
pkgver=0.165.0
pkgrel=1
pkgdesc="Media server for comics/mangas/BDs with API and OPDS support "
arch=('any')
url="https://komga.org"
license=('MIT')
depends=('java-runtime-headless>=8')
backup=(etc/komga.conf)
source=("https://github.com/gotson/komga/releases/download/v${pkgver}/komga-${pkgver}.jar"
        "komga"
        "komga.sysusers"
        "komga.service"
        "komga.tmpfiles"
        "komga.env")
package() {
  cd "$pkgdir"
  install -Dm755 "$srcdir"/komga-"$pkgver".jar usr/share/java/komga/komga.jar
  install -Dm755 "$srcdir"/komga usr/bin/komga
  install -Dm644 "${srcdir}/komga.service" "${pkgdir}/usr/lib/systemd/system/komga.service"
  install -Dm644 "${srcdir}/komga.sysusers" "${pkgdir}/usr/lib/sysusers.d/komga.conf"
  install -Dm644 "${srcdir}/komga.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/komga.conf"
  install -Dm644 "${srcdir}/komga.env" "${pkgdir}/etc/komga.conf"
}
# AUTOMATICALLY ADDED BY SCRIPT ON NEW RELEASE #
md5sums=('947383c4248bbfa5126559e57b8be97e'
         'e5713c297be47045511f06664574754f'
         'cce81e91d6710d7413f4c934834ef8e4'
         '537b1c70998d793639a3132345af33f6'
         'ed67e35d511c361799745573dd77a16a'
         '48cc6870981e1fa66a7def9bc2029425')
