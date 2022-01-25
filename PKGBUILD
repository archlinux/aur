# Maintainer: Caio Alonso <caio@caioalonso.com>

pkgname=godns-bin
pkgver=2.6
pkgrel=1
pkgdesc="A dynamic DNS client tool, supports AliDNS, Cloudflare, Google Domains, DNSPod, HE.net & DuckDNS, written in Go"
arch=('x86_64')
url='https://github.com/timothyye/godns'
license=('Apache')
provides=('godns')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TimothyYe/godns/releases/download/v${pkgver}/godns_${pkgver}_Linux_x86_64.tar.gz"
        "godns.conf::https://raw.githubusercontent.com/TimothyYe/godns/v${pkgver}/configs/config_sample.json")
sha256sums=('a51e968aaec1f462882615b5281f8c0b3a3cbdbc83af21c06b80fdb952a36990'
            '2769b4cd7d988464801f90db1905a6c7fc19b2dc4e094c3069fc50486aa24a77')

package() {
  install -Dm755 "${srcdir}"/godns "${pkgdir}/usr/bin/godns"
  install -Dm644 "${srcdir}"/godns.conf "${pkgdir}/etc/conf.d/godns.conf"
}
