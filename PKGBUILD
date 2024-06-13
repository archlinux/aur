# Maintainer: Thorsten Müller

pkgname=filebeat-oss-bin
pkgver=8.14.1
pkgrel=0
pkgdesc='Data shippers for Elasticsearch'
arch=('x86_64')
url='https://www.elastic.co/products/beats'
license=('Apache')
depends=('glibc')
conflicts=(filebeat-oss)
source=("https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-${pkgver}-linux-x86_64.tar.gz"
        "filebeat-oss.service")
sha512sums=('9e4d150d168a9db3403765cfd82bc54f672720bfcecb0b8720ac29d2d7e867a41820c6c5ef33d9a0a28982f3c2722f4d61a08227f8feae73f5311389074ea949'
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
