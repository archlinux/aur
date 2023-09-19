# Maintainer: Thorsten Müller

pkgname=filebeat-oss-bin
pkgver=8.10.1
pkgrel=0
pkgdesc='Data shippers for Elasticsearch'
arch=('x86_64')
url='https://www.elastic.co/products/beats'
license=('Apache')
depends=('glibc')
conflicts=(filebeat-oss)
source=("https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-${pkgver}-linux-x86_64.tar.gz"
        "filebeat-oss.service")
sha512sums=('632f4c98d324124576628b26b8d9521fbef51bdc215c0a6be4f8e50c89d514da023f110277112809af68cc1fe870498b076ef23523789caec6681398ba0656d6'
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
