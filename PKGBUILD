# Maintainer: Caio Alonso <caio@caioalonso.com>

pkgname=godns-bin
pkgver=2.8.9
pkgrel=1
pkgdesc="A dynamic DNS client tool, supports AliDNS, Cloudflare, Google Domains, DNSPod, HE.net & DuckDNS, written in Go"
arch=('x86_64')
url='https://github.com/timothyye/godns'
license=('Apache')
provides=('godns')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TimothyYe/godns/releases/download/v${pkgver}/godns_${pkgver}_Linux_x86_64.tar.gz"
        "godns.conf::https://raw.githubusercontent.com/TimothyYe/godns/v${pkgver}/configs/config_sample.json")
sha256sums=('e6e4f52bbb3c928eb886595336075012857ed4fb2282170b6868db0bec5969a6'
            '1a3ebb3f4edab009f3fc792b95a14e0ffa5a64463adbe6d71e0030d492ac54fc')

package() {
  install -Dm755 "${srcdir}"/godns "${pkgdir}/usr/bin/godns"
  install -Dm644 "${srcdir}"/godns.conf "${pkgdir}/etc/conf.d/godns.conf"
}
