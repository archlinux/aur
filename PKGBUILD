# Maintainer: killab33z <killab33z @ protonmail-dot-com>
pkgname=netscout-git
_pkgname=netscout
pkgver=0.1.0.772eba8f8b
pkgrel=1
pkgdesc="Tool designed to bypass HTTP 403 (Forbidden) pages using various techniques."
arch=('any')
url="https://github.com/caio-ishikawa/netscout"
license=('custom')
depends=('git' 'go')
provides=('netscout')
conflicts=('netscout' 'netscout-bin')
source=("git+$url")
sha512sums=('SKIP')

build() {
  cd $_pkgname
  go build -o netscout main.go
}

package() {
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm0755 $srcdir/$_pkgname/netscout "$pkgdir/usr/bin/netscout"
}

