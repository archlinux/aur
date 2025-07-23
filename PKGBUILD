# Maintainer: Thorsten Müller

pkgname=filebeat-oss-bin
pkgver=9.0.4
pkgrel=0
pkgdesc='Data shippers for Elasticsearch'
arch=('x86_64')
url='https://www.elastic.co/products/beats'
license=('Apache')
depends=('glibc')
conflicts=(filebeat-oss)
source=("https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-${pkgver}-linux-x86_64.tar.gz"
        "filebeat-oss.service")
sha512sums=('9bfa6fc3cc778fb35953c8a62b16b0c369c137d19ce7e93b09fd56b06e8ab728d211ea6c249295f3c36f50e8cb5fb9c2a0d13c6802724001d4d0fbbdc7fc1964'
            '405bc15510c0d39bbbf5f21db8eaa7b6a4032fd199c2115cfc6df23a32b072b40dffea524b9b779fbe624604b91d20e91d4e67e00e854ad5322ff9105609f779')
backup=('etc/filebeat-oss/filebeat.yml' 'etc/filebeat-oss/fields.yml' 'etc/filebeat-oss/filebeat.reference.yml')
srcpath="filebeat-${pkgver}-linux-x86_64"

package() {
  install -Dm755 "${srcdir}/${srcpath}/filebeat" "${pkgdir}/usr/bin/filebeat-oss"
  install -Dm644 "${srcdir}/${srcpath}/filebeat.yml" "${pkgdir}/etc/filebeat-oss/filebeat.yml"
  install -Dm644 "${srcdir}/${srcpath}/filebeat.reference.yml" "${pkgdir}/etc/filebeat-oss/filebeat.reference.yml"
  install -Dm644 "${srcdir}/${srcpath}/fields.yml" "${pkgdir}/etc/filebeat-oss/fields.yml"
  install -Dm644 "filebeat-oss.service" "${pkgdir}/usr/lib/systemd/system/filebeat-oss.service"
}
