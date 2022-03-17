# Maintainer: suienzan <suienzan at gmail dot com>
_pkgname=mosdns
pkgname=${_pkgname}-bin
pkgver=3.5.2
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
sha256sums=('1000fb94a3baca55f80cda0df487a603be7c37309c246b7c0a6d558cc1d1db74')

package() {
  install -Dm755 mosdns "$pkgdir"/usr/bin/mosdns
  install -Dm644 ../service "$pkgdir"/usr/lib/systemd/system/mosdns.service
  install -Dm644 ../config.yaml "$pkgdir"/etc/mosdns/config.yaml
}
