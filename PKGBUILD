# Maintainer: killab33z <killab33z @ protonmail-dot-com>
pkgname=lofio-git
_pkgname=lofio
pkgver=0.3.0.ad619fca10
pkgrel=1
pkgdesc="Lofi hip-hop radio player"
url="https://codeberg.org/dikey0ficial/lofio"
arch=('x86_64')
license=('custom')
makedepends=('git' 'go')
conflicts=('lofio' 'lofio-bin')
source=("git+$url")
sha256sums=('SKIP')

build() {
  cd "$srcdir"/$_pkgname/gui/$_pkgname
  go build .
}

package() {
  install -Dm644 "$srcdir/$_pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm755 "$srcdir/$_pkgname/gui/$_pkgname/lofio" "$pkgdir/opt/$_pkgname/lofio"
  # create symlinks
  install -d "$pkgdir/usr/bin"
  ln -s /opt/$_pkgname/lofio "$pkgdir/usr/bin"
}
