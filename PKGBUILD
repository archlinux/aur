# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=godns-bin
pkgver=2.1
pkgrel=1
pkgdesc="A dynamic DNS client tool, supports AliDNS, Cloudflare, Google Domains, DNSPod, HE.net & DuckDNS, written in Go"
arch=('x86_64')
url='https://github.com/timothyye/godns'
license=('Apache-2.0')
provides=('godns')
source=("https://github.com/TimothyYe/godns/releases/download/V${pkgver}/godns-linux64-${pkgver}.tar.gz"
		'https://github.com/TimothyYe/godns/raw/master/config_sample.json')
md5sums=('bf69abe39a6e76289436c2b0112dda76'
		 '0f821cf673075c6666736f78cacac8a2')

package() {
  install -Dm755 "${srcdir}"/godns "${pkgdir}/usr/bin/godns"
  install -Dm644 "${srcdir}"/config_sample.json "${pkgdir}/etc/conf.d/godns.conf"
}