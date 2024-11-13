# Maintainer: Thorsten Müller

pkgname=auditbeat-oss-bin
pkgver=8.16.0
pkgrel=0
pkgdesc='Data shippers for Elasticsearch'
arch=('x86_64')
url='https://www.elastic.co/products/beats'
license=('Apache')
depends=('glibc')
conflicts=(auditbeat-oss)
source=("https://artifacts.elastic.co/downloads/beats/auditbeat/auditbeat-${pkgver}-linux-x86_64.tar.gz"
        "auditbeat-oss.service")
sha512sums=('c60942491412dcee1b45814c452870779404e2602ad828a18171f90325445509ed8aed1205d2a2936e2c25cc0e42977f23edab3146ba276630592ee14d402e6f'
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
