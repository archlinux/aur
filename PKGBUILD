# Maintainer: Arthur McLain <mclain.it@gmail.com>
# Contributor: Nikhil Singh <nik.singh710@gmail.com>
pkgname=getnf
pkgver=0.2.0.r1.gd58e0e7
pkgrel=1
pkgdesc='Simple utility to install nerd fonts'
url='https://github.com/getnf/getnf'
source=('git+https://github.com/getnf/getnf.git')
arch=('any')
license=('GPL-3.0-or-later')
makedepends=('git')
depends=('curl' 'fontconfig')
optdepends=('fzf: for "getnf -f" functionality')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"
  install -Dm755 ./getnf "$pkgdir/usr/bin/$pkgname"
  install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
