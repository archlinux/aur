# Maintainer: Arthur McLain <mclain.it@gmail.com>
pkgname=getnf-git
_pkgname=getnf
pkgver=0.3.0.r2.gf8b6f57
pkgrel=1
pkgdesc='Command-line tool for installing Nerd Fonts'
url='https://github.com/getnf/getnf'
source=('git+https://github.com/getnf/getnf.git')
arch=('any')
license=('GPL-3.0-or-later')
makedepends=('git')
depends=('curl')
optdepends=('fzf: for "getnf -f" functionality')
conflicts=('getnf')
provides=('getnf')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 getnf "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 man/getnf.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
