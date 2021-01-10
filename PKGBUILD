# Maintainer: Michał Wołoszyn <kontakt@fraunos.pl>

_pkgname=arc-unit-mocha
pkgname="${_pkgname}-git"

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

pkgver=r13.259af28
pkgrel=1
pkgdesc='Various linters for Phabricator (via arcanist) by Pinterest'
arch=('any')
url="https://github.com/sealcode/arc-unit-mocha"
license=('BSD3')
depends=('php' 'python' 'arcanist-git')
optdepends=('git: Git VCS support'
            'subversion: Subversion VCS support'
            'mercurial: Mercurial VCS support')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/sealcode/arc-unit-mocha.git")
sha256sums=('SKIP')

package() {
  install -d "$pkgdir/usr/share/php/$_pkgname/"
  cp -a $_pkgname/* "$pkgdir/usr/share/php/$_pkgname/"
}
