# Maintainer: Arthur McLain <mclain.it@gmail.com>
# Contributor: Nikhil Singh <nik.singh710@gmail.com>
pkgname=getnf
pkgver=0.2.0.r12.g1de70d9
pkgrel=1
pkgdesc='Command-line tool for installing Nerd Fonts'
url='https://github.com/getnf/getnf'
source=('git+https://github.com/getnf/getnf.git')
arch=('any')
license=('GPL-3.0-or-later')
makedepends=('git')
depends=('curl' 'fontconfig')
optdepends=('fzf: for "getnf -f" functionality')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 getnf "$pkgdir/usr/bin/$pkgname"
  install -Dm644 man/getnf.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
