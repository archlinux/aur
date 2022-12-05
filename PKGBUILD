# Maintainer: Whyme Lyu <callme5long@gmail.com>
pkgname=dnsproxy-bin
pkgver=0.46.4
pkgrel=1
pkgdesc="Simple DNS proxy with DoH, DoT, DoQ and DNSCrypt support"
arch=('x86_64')
url="https://github.com/AdguardTeam/dnsproxy"
license=('Apache')
depends=()
makedepends=()
provides=(dnsproxy)
conflicts=(dnsproxy dnsproxy-adguard)
source=(
  "https://github.com/AdguardTeam/dnsproxy/releases/download/v$pkgver/dnsproxy-linux-amd64-v$pkgver.tar.gz"
  dnsproxy.yaml
  dnsproxy.service
)
_conf=etc/dnsproxy/dnsproxy.yaml
backup=($_conf)

package() {
  cd "${srcdir}"
  install -Dm755 linux-amd64/dnsproxy "$pkgdir"/usr/bin/dnsproxy
  install -Dm644 linux-amd64/LICENSE "$pkgdir"/usr/share/license/dnsproxy/LICENSE
  install -Dm644 linux-amd64/README.md "$pkgdir"/usr/share/doc/dnsproxy/README.md
  install -Dm644 dnsproxy.yaml "$pkgdir/$_conf"
  install -Dm644 dnsproxy.service "$pkgdir"/usr/lib/systemd/system/dnsproxy.service
}

sha256sums=('e5e08e13441126e7d65a04601f31fd05631af266952d2412bae8d7f188ac78d8'
            '288285a22300b41678e3c729e2d39d8af394b7e6b1e0acfb13284c1c7311c982'
            '565eea9808589ecafa81f2229ac1f85b39028e26d488a9a7c0b51afc43d7f42b')
