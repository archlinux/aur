# Maintainer: suienzan <suienzan at gmail dot com>
_pkgname=mosdns
pkgname=${_pkgname}-bin
pkgver=3.1.2
pkgrel=1
pkgdesc="Plug-in configured DNS forwarder/server"
arch=('x86_64')
url="https://github.com/IrineSistiana/mosdns/"
license=('GPL3')
optdepends=('v2ray-domain-list-community: geosite.dat'
            'v2ray-geoip: geoip.dat'
            'v2ray-rules-dat-git: geosite.dat & geoip.dat')
backup=('etc/mosdns/config.yaml')
provides=('mosdns')
conflicts=('mosdns' 'mosdns-git')
source=("$pkgname-$pkgver.zip::https://github.com/IrineSistiana/mosdns/releases/download/v${pkgver}/mosdns-linux-amd64.zip")
sha256sums=('02f0701897e9da20f40ee317cd5158e6ba3c9008a2f488a55f69cef7da25c7d9')

package() {
  install -Dm755 mosdns "$pkgdir"/usr/bin/mosdns
  install -Dm644 ../service "$pkgdir"/usr/lib/systemd/system/mosdns.service
  install -Dm644 ../config.yaml "$pkgdir"/etc/mosdns/config.yaml
}
