# Maintainer: Thorsten Müller

pkgname=filebeat-oss-bin
pkgver=8.11.1
pkgrel=0
pkgdesc='Data shippers for Elasticsearch'
arch=('x86_64')
url='https://www.elastic.co/products/beats'
license=('Apache')
depends=('glibc')
conflicts=(filebeat-oss)
source=("https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-${pkgver}-linux-x86_64.tar.gz"
        "filebeat-oss.service")
sha512sums=('a8ae4e1ba9a929d77700d8d625e1c5c2b4e7be9cbe7be22e722cafd30786c64ef518e15794dcf9a6ea6a6e74074da2492726b1fe5e836ac50fae1718043ade52'
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
