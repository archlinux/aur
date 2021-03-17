# Maintainer: Caio Alonso <caio@caioalonso.com>

pkgname=godns-bin
pkgver=2.3.3
pkgrel=1
pkgdesc="A dynamic DNS client tool, supports AliDNS, Cloudflare, Google Domains, DNSPod, HE.net & DuckDNS, written in Go"
arch=('x86_64')
url='https://github.com/timothyye/godns'
license=('Apache')
provides=('godns')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TimothyYe/godns/releases/download/V${pkgver}/godns-linux64-${pkgver}.tar.gz"
        'godns.conf::https://github.com/TimothyYe/godns/raw/master/config_sample.json')
sha256sums=('2c235a50e22a9b6babaa96bbd3ebf44e095b59f871774b9ff4bfb7231fbed042'
            '24401b0cdb450c9b8698c7682137a6c602f52e7cdcf739b53de7dec6bce1c1d1')

package() {
  install -Dm755 "${srcdir}"/godns "${pkgdir}/usr/bin/godns"
  install -Dm644 "${srcdir}"/godns.conf "${pkgdir}/etc/conf.d/godns.conf"
}
