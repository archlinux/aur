# Maintainer: Caio Alonso <caio@caioalonso.com>

pkgname=godns-bin
pkgver=2.5.1
pkgrel=1
pkgdesc="A dynamic DNS client tool, supports AliDNS, Cloudflare, Google Domains, DNSPod, HE.net & DuckDNS, written in Go"
arch=('x86_64')
url='https://github.com/timothyye/godns'
license=('Apache')
provides=('godns')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TimothyYe/godns/releases/download/v${pkgver}/godns-linux64-${pkgver}.tar.gz"
        'godns.conf::https://github.com/TimothyYe/godns/raw/master/config_sample.json')
sha256sums=('fb52b014bc09484a9fffd0f5922a4875e4adb620f4f478af9a073d455e9e9573'
            '2769b4cd7d988464801f90db1905a6c7fc19b2dc4e094c3069fc50486aa24a77')

package() {
  install -Dm755 "${srcdir}"/godns "${pkgdir}/usr/bin/godns"
  install -Dm644 "${srcdir}"/godns.conf "${pkgdir}/etc/conf.d/godns.conf"
}
