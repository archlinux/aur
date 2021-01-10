# Maintainer: Michał Wołoszyn <kontakt@fraunos.pl>

_pkgname=arcanist-linters
pkgname="${_pkgname}-git"

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

pkgver=r106.4b2b839
pkgrel=1
pkgdesc='Various linters for Phabricator (via arcanist) by Pinterest'
arch=('any')
url="https://github.com/pinterest/arcanist-linters"
license=('Apache')
depends=('php' 'python' 'arcanist-git')
optdepends=('git: Git VCS support'
            'subversion: Subversion VCS support'
            'mercurial: Mercurial VCS support')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/pinterest/arcanist-linters.git")
sha256sums=('SKIP')

package() {
  install -d "$pkgdir/usr/share/php/$_pkgname/"
  cp -a $_pkgname/* "$pkgdir/usr/share/php/$_pkgname/"
}
