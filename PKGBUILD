# Maintainer: Thorsten Müller

pkgname=auditbeat-oss-bin
pkgver=8.6.2
pkgrel=0
pkgdesc='Data shippers for Elasticsearch'
arch=('x86_64')
url='https://www.elastic.co/products/beats'
license=('Apache')
depends=('glibc')
conflicts=(auditbeat-oss)
source=("https://artifacts.elastic.co/downloads/beats/auditbeat/auditbeat-${pkgver}-linux-x86_64.tar.gz"
        "auditbeat-oss.service")
sha512sums=('6a0e1087658bce31030dcbcfcff99d724799c274b18d845f1932ce17772bbaf6f03c573dbf536a4678cab29677a30db5cfefd917176a115744d4073561c1fdef'
            '6c2b7ad706efbbaab55e2bd6a63dd85ee358aeed8255a829adeacdcd45d364520cc7f0328cfa966d61e911042d8fac40abc7ff36cdb7a834fc83df7da94fce13')
backup=('etc/auditbeat-oss/auditbeat.yml', 'etc/auditbeat-oss/fields.yml')
srcpath="auditbeat-${pkgver}-linux-x86_64"

package() {
  install -Dm755 "${srcdir}/${srcpath}/auditbeat" "${pkgdir}/usr/bin/auditbeat-oss"
  install -Dm644 "${srcdir}/${srcpath}/auditbeat.yml" "${pkgdir}/etc/auditbeat-oss/auditbeat.yml"
  install -Dm644 "${srcdir}/${srcpath}/auditbeat.reference.yml" "${pkgdir}/etc/auditbeat-oss/auditbeat.reference.yml"
  install -Dm644 "${srcdir}/${srcpath}/fields.yml" "${pkgdir}/etc/auditbeat-oss/fields.yml"
  install -Dm644 "auditbeat-oss.service" "${pkgdir}/usr/lib/systemd/system/auditbeat-oss.service"
}
