# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=godns-bin
pkgver=2.2
pkgrel=1
pkgdesc="A dynamic DNS client tool, supports AliDNS, Cloudflare, Google Domains, DNSPod, HE.net & DuckDNS, written in Go"
arch=('x86_64')
url='https://github.com/timothyye/godns'
license=('Apache')
provides=('godns')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TimothyYe/godns/releases/download/V${pkgver}/godns-linux64-${pkgver}.tar.gz"
		'godns.conf::https://github.com/TimothyYe/godns/raw/master/config_sample.json')
sha256sums=('959321bc0f03ffd5cd6a0b2c663cd4e419b893dd3c8b50be207a5ea474ce1c8a'
		 '24401b0cdb450c9b8698c7682137a6c602f52e7cdcf739b53de7dec6bce1c1d1')

package() {
  install -Dm755 "${srcdir}"/godns "${pkgdir}/usr/bin/godns"
  install -Dm644 "${srcdir}"/godns.conf "${pkgdir}/etc/conf.d/godns.conf"
}