# Contributor: tyr0 <thomas.hoernes@gmx.at>
# Contributor: Daniel YC Lin <dlin.tw at gmail>
# Maintainer: Y Paritcher <y.archlinux@paritcher.com>

pkgname=xxdiff
pkgver=5.1
pkgrel=1
pkgdesc="A graphical browser for file and directory differences."
url="https://github.com/blais/xxdiff"
license=('GPL2')
depends=('qt6-base')
makedepends=('flex>=2.5.31' 'bison' 'git' 'python-docutils')
arch=('x86_64' 'i686')
_commit=090aa680265e77812ed8faa75482ec8efdb44913
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
