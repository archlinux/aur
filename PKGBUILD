# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=arcanist
pkgver=2018.31
_commit=9dfa68d739ee05e806018821cd4d997307ae54f1
pkgrel=1
pkgdesc='The command line interface for Phabricator'
arch=('any')
url="https://www.phacility.com/phabricator/"
license=('Apache')
depends=('libphutil' 'python')
makedepends=('git')
source=("git://github.com/phacility/arcanist.git#commit=${_commit}")
sha256sums=('SKIP')

package() {
  install -d "$pkgdir/usr/share/php/$pkgname/" "$pkgdir/usr/bin/"
  cp -a $pkgname/* "$pkgdir/usr/share/php/$pkgname/"
  install -Dm644 $pkgname/resources/shell/bash-completion "$pkgdir/usr/share/bash-completion/completions/arc"
  ln -s ../share/php/$pkgname/bin/arc "$pkgdir/usr/bin/arc"
}
