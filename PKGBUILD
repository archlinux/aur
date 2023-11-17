# Maintainer: Whyme Lyu <callme5long@gmail.com>
pkgname=dnsproxy-bin
pkgver=0.59.0
pkgrel=1
pkgdesc="Simple DNS proxy with DoH, DoT, DoQ and DNSCrypt support"
arch=('x86_64')
url="https://github.com/AdguardTeam/dnsproxy"
license=('Apache')
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
  cd "$srcdir"
  install -Dm755 linux-amd64/dnsproxy "$pkgdir"/usr/bin/dnsproxy
  install -Dm644 linux-amd64/LICENSE "$pkgdir"/usr/share/license/dnsproxy/LICENSE
  install -Dm644 linux-amd64/README.md "$pkgdir"/usr/share/doc/dnsproxy/README.md
  install -Dm644 dnsproxy.yaml "$pkgdir/$_conf"
  install -Dm644 dnsproxy.service "$pkgdir"/usr/lib/systemd/system/dnsproxy.service
}
sha256sums=('f5d5ccfccb81c506a1a60fb012878c94fea11aa6f452d457da16f4690637ee7a'
            '72937969cc68182672e945fb26a6e350772a421463a4593c113d2f89af0b922c'
            '565eea9808589ecafa81f2229ac1f85b39028e26d488a9a7c0b51afc43d7f42b')
