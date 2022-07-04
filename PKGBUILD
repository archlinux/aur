# Maintainer: Caio Alonso <caio@caioalonso.com>

pkgname=godns-bin
pkgver=2.7.9
pkgrel=1
pkgdesc="A dynamic DNS client tool, supports AliDNS, Cloudflare, Google Domains, DNSPod, HE.net & DuckDNS, written in Go"
arch=('x86_64')
url='https://github.com/timothyye/godns'
license=('Apache')
provides=('godns')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TimothyYe/godns/releases/download/v${pkgver}/godns_${pkgver}_Linux_x86_64.tar.gz"
        "godns.conf::https://raw.githubusercontent.com/TimothyYe/godns/v${pkgver}/configs/config_sample.json")
sha256sums=('0d8aca1526e3298d1214d7b652e2ad9aaccadfed0489674af0807a8438fb1f1b'
            '13206465a8d503837a8f56e145bc76fbdb9e9077a4dee5a6db6162d7cf065804')

package() {
  install -Dm755 "${srcdir}"/godns "${pkgdir}/usr/bin/godns"
  install -Dm644 "${srcdir}"/godns.conf "${pkgdir}/etc/conf.d/godns.conf"
}
