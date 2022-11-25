# Maintainer: AlieZ <aaliezz840@gmail.com>
pkgname=v2ray4-bin
pkgver=4.45.2
pkgrel=1
pkgdesc="A set of network tools that helps you to build your own computer network (old version)."
arch=(x86_64)
url="https://github.com/v2fly/v2ray-core"
license=(MIT)
depends=(glibc v2ray-domain-list-community v2ray-geoip)
backup=(etc/v2ray/config.json)
conflicts=(v2ray v2ray-git)
source=("v2ray-linux-64.zip::https://github.com/v2fly/v2ray-core/releases/download/v$pkgver/v2ray-linux-64.zip")
sha512sums=('SKIP')

package() {
  cd "$srcdir"
  install -Dm644 systemd/system/v2ray.service "$pkgdir"/usr/lib/systemd/system/v2ray.service
  install -Dm644 systemd/system/v2ray@.service "$pkgdir"/usr/lib/systemd/system/v2ray@.service
  install -Dm644 *.json -t "$pkgdir"/etc/v2ray/
  install -Dm755 v2ray -t "$pkgdir"/usr/bin/
  install -Dm755 v2ctl -t "$pkgdir"/usr/bin/
}
