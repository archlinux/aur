# Maintainer: Caio Alonso <caio@caioalonso.com>

pkgname=godns-bin
pkgver=3.1.6
pkgrel=1
pkgdesc="A dynamic DNS client tool, supports AliDNS, Cloudflare, Google Domains, DNSPod, HE.net & DuckDNS, written in Go"
arch=('x86_64')
url='https://github.com/timothyye/godns'
license=('Apache')
provides=('godns')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TimothyYe/godns/releases/download/v${pkgver}/godns_${pkgver}_linux_amd64.tar.gz"
	"godns.conf::https://raw.githubusercontent.com/TimothyYe/godns/v${pkgver}/configs/config_sample.json")
sha256sums=('830d12cf299acc38c19eb288abd65158bf8537a1b47a44b06053830f544966ad'
	'4fa9de0eb97f6cdb0198654c60643acaa4c637637af5c0a05c9b6acd6ddfaaf7')

package() {
	install -Dm755 "${srcdir}"/godns "${pkgdir}/usr/bin/godns"
	install -Dm644 "${srcdir}"/godns.conf "${pkgdir}/etc/conf.d/godns.conf"
}
