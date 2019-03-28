# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=arcanist
pkgver=2019.10
_commit=4d22e0f89f10b8a7f47f6ee615e0ccf0f354e582
pkgrel=1
pkgdesc='The command line interface for Phabricator'
arch=('any')
url="https://www.phacility.com/phabricator/"
license=('Apache')
depends=('libphutil' 'php' 'python')
optdepends=('git: Git VCS support'
            'subversion: Subversion VCS support'
            'mercurial: Mercurial VCS support')
makedepends=('git')
source=("git://github.com/phacility/arcanist.git#commit=${_commit}")
sha256sums=('SKIP')

package() {
  install -d "$pkgdir/usr/share/php/$pkgname/" "$pkgdir/usr/bin/"
  cp -a $pkgname/* "$pkgdir/usr/share/php/$pkgname/"
  install -Dm644 $pkgname/resources/shell/bash-completion "$pkgdir/usr/share/bash-completion/completions/arc"
  ln -s ../share/php/$pkgname/bin/arc "$pkgdir/usr/bin/arc"
}
