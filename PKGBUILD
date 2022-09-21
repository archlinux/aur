# Maintainer: Thorsten Müller

pkgname=journalbeat-oss-bin
pkgver=7.15.2
pkgrel=2
pkgdesc='Data shippers for Elasticsearch'
arch=('x86_64')
url='https://www.elastic.co/products/beats'
license=('Apache')
depends=('glibc')
conflicts=(journalbeat-oss)
source=("https://artifacts.elastic.co/downloads/beats/journalbeat/journalbeat-oss-${pkgver}-linux-x86_64.tar.gz"
        "journalbeat-oss.service")
sha512sums=('f2d4e0588736a606cb09cb17089d7f4b761e78763e7be41b9b0f66bd71ac8d0cd7713c654f14ce15db22b532913ea8b2fd4125e3fd3019602d87a4cbdb534fea'
            '977a8209341891902a3edaedcab4370ab87260f88031c404dfbae7633d9b11673fa2719f81acc716cea6028a670c484092f579e560e2ba621e74682cf08efa2f')
backup=('etc/journalbeat-oss/journalbeat.yml', 'etc/journalbeat-oss/fields.yml')
srcpath="journalbeat-${pkgver}-linux-x86_64"

package() {
  install -Dm755 "${srcdir}/${srcpath}/journalbeat" "${pkgdir}/usr/bin/journalbeat-oss"
  install -Dm644 "${srcdir}/${srcpath}/journalbeat.yml" "${pkgdir}/etc/journalbeat-oss/journalbeat.yml"
  install -Dm644 "${srcdir}/${srcpath}/journalbeat.reference.yml" "${pkgdir}/etc/journalbeat-oss/journalbeat.reference.yml"
  install -Dm644 "${srcdir}/${srcpath}/fields.yml" "${pkgdir}/etc/journalbeat-oss/fields.yml"
  install -Dm644 "journalbeat-oss.service" "${pkgdir}/usr/lib/systemd/system/journalbeat-oss.service"
}
