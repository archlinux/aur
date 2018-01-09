# Maintainer:  Novikov Maxim <the.mlex@gmail.com>

pkgname=lanyus-reverse-proxy
pkgver=1.0.0
pkgrel=1
pkgdesc="Lanyus reverse proxy"
arch=('x86_64' 'i686')
license=('BSD')
depends=()
url="https://github.com/ilanyu/ReverseProxy"
makedepends=(go git)
provides=('lanyus-reverse-proxy')
source=("https://raw.githubusercontent.com/ilanyu/ReverseProxy/master/main.go" "lanyus-reverse-proxy.service")
sha256sums=('33a2df5ef7d4926a041087bd6fac77c39143449f3373d8959deae094d618244a'
    'ff1480583ff8cc42c7f34f625aca28a724ade42f91a5ca842b95dfa29296bb2b')

package() {
  go build main.go
  install -Dm755 main "$pkgdir"/opt/lanyus-reverse-proxy/reverse-proxy
  install -Dm644 lanyus-reverse-proxy.service "$pkgdir"/usr/lib/systemd/system/lanyus-reverse-proxy.service
}
