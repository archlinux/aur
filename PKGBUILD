# Maintainer: killab33z <killab33z @ protonmail-dot-com>
pkgname=403jump-git
_pkgname=403jump
pkgver=0.1.0.772eba8f8b
pkgrel=1
pkgdesc="Tool designed to bypass HTTP 403 (Forbidden) pages using various techniques."
arch=('any')
url="https://github.com/trap-bytes/403jump"
license=('MIT')
depends=('git' 'go')
provides=('403jump')
conflicts=('403jump' '403jump-bin')
source=("git+$url")
sha512sums=('SKIP')

build() {
  cd $_pkgname
  go build -o 403jump main.go httphandler.go
}

package() {
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm0755 $srcdir/$_pkgname/403jump "$pkgdir/usr/bin/403jump"
}

