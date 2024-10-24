# Maintainer: suienzan <suienzan at gmail dot com>
_pkgname=mosdns
pkgname=${_pkgname}-bin
pkgver=5.3.3
pkgrel=2
pkgdesc="一个 DNS 转发器"
arch=('x86_64')
url="https://github.com/IrineSistiana/mosdns/"
license=('GPL3')
provides=('mosdns')

source=(
  "$pkgname-$pkgver.zip::https://github.com/IrineSistiana/mosdns/releases/download/v${pkgver//_/-}/mosdns-linux-amd64.zip"
  "service"
  "sysusers"
  "tmpfiles"
)

sha256sums=('ba56429521679e4c72de800addbfd95cc0cf9073f740a52dda6ce78c7f9350b5'
            '85736cfb34acaa55d423122b75bcd39433a82f06e5e92195a0e6bb745d275452'
            'e6bc5034452123491e3901e2741183d528a29b00f1c01d6bbbb204549fee7306'
            '73c47567934255c4030ab06798a602989c257c187cf0c00132fbc839c902b096')

package() {
  install -Dm755 mosdns "$pkgdir"/usr/bin/mosdns
  install -dm755 "$pkgdir"/etc/mosdns
  install -Dm644 sysusers "$pkgdir"/usr/lib/sysusers.d/mosdns.conf
  install -Dm644 tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/mosdns.conf
  install -Dm644 service "$pkgdir"/usr/lib/systemd/system/mosdns.service
}
