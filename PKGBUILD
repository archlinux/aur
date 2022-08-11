# Maintainer: thorko contact@thorko.de
pkgname=elasticsearch-bin
pkgver=8.3.3
pkgrel=0
pkgdesc="Log analyzer. search, store and analyze logs"
arch=('x86_64')
url='https://elastic.co'
license=('ELv2')
source_x86_64=("https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('7b1f1a1fe314309f6325e8955350368d93c62a4378f2c7004dd9147169ce11d2')

install=elasticsearch.install

source=(
  "elasticsearch.service"
  "sysctl.conf"
  "users.conf"
)

sha256sums=(
  'e42a11bfcacad2d600dad28f88d94553a03e598eba69c58f677a61b2e7ea4e7b'
  'b3feb1e9c7e7ce6b33cea6c727728ed700332aae942ca475c3bcc1d56b9f113c'
  'fc9683349457f56bcd044cd8e711bc8efd43d32f9547d5b21a66650c6dfbed73'
)

package() {
    mkdir -p "${pkgdir}/opt"
    cp -R "${srcdir}/elasticsearch-${pkgver}" "${pkgdir}/opt/elasticsearch"
    install -Dm0644 "elasticsearch.service" "${pkgdir}/etc/systemd/system/elasticsearch.service"
    install -Dm0644 "sysctl.conf" "${pkgdir}/usr/lib/sysctl.d/elasticsearch.conf"
    install -Dm0644 "users.conf" "${pkgdir}/usr/lib/sysusers.d/elasticsearch.conf"
}
