# Maintainer: Thorsten Müller

pkgname=filebeat-oss-bin
pkgver=8.9.0
pkgrel=0
pkgdesc='Data shippers for Elasticsearch'
arch=('x86_64')
url='https://www.elastic.co/products/beats'
license=('Apache')
depends=('glibc')
conflicts=(filebeat-oss)
source=("https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-${pkgver}-linux-x86_64.tar.gz"
        "filebeat-oss.service")
sha512sums=('b129a6fd7017407f5db11c81173f1ca6b2a0705b8cd48bf354fb385b5246269456093021d8850d6eb4fce6945c4e7fe5378cd3cc53dcb1db2153e554dbb8bd48'
            '405bc15510c0d39bbbf5f21db8eaa7b6a4032fd199c2115cfc6df23a32b072b40dffea524b9b779fbe624604b91d20e91d4e67e00e854ad5322ff9105609f779')
backup=('etc/filebeat-oss/filebeat.yml', 'etc/filebeat-oss/fields.yml')
srcpath="filebeat-${pkgver}-linux-x86_64"

package() {
  install -Dm755 "${srcdir}/${srcpath}/filebeat" "${pkgdir}/usr/bin/filebeat-oss"
  install -Dm644 "${srcdir}/${srcpath}/filebeat.yml" "${pkgdir}/etc/filebeat-oss/filebeat.yml"
  install -Dm644 "${srcdir}/${srcpath}/filebeat.reference.yml" "${pkgdir}/etc/filebeat-oss/filebeat.reference.yml"
  install -Dm644 "${srcdir}/${srcpath}/fields.yml" "${pkgdir}/etc/filebeat-oss/fields.yml"
  install -Dm644 "filebeat-oss.service" "${pkgdir}/usr/lib/systemd/system/filebeat-oss.service"
}
