# Contributor: tyr0 <thomas.hoernes@gmx.at>
# Contributor: Daniel YC Lin <dlin.tw at gmail>
# Maintainer: Y Paritcher <y.archlinux@paritcher.com>

pkgname=xxdiff
pkgver=5.0
pkgrel=3
pkgdesc="A graphical browser for file and directory differences."
url="https://github.com/blais/xxdiff"
license=('GPL2')
depends=('qt5-base')
makedepends=('flex>=2.5.31' 'bison' 'git' 'python-docutils')
arch=('x86_64' 'i686')
_commit=30b44034e5cc2665f7fc44ce45da7252d46cbe17
source=("git+https://github.com/blais/xxdiff.git#commit=$_commit")
md5sums=('SKIP')

build() {
  cd "$pkgname/src"
  make -f Makefile.bootstrap
  make
}

package() {
  cd "$pkgname"
  install -D -m 755 "bin/xxdiff" "$pkgdir/usr/bin/xxdiff"
  install -D -m 644 "src/xxdiff.1" "$pkgdir/usr/share/man/man1/xxdiff.1"
}
