# Maintainer: Michał Wołoszyn <kontakt@fraunos.pl>

_pkgname=arc-unit-mocha
pkgname="${_pkgname}-git"

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

pkgver=r8.39522af
pkgrel=1
pkgdesc='An xunit and clover -based unit tests runner for Arcanist.'
arch=('any')
url="https://github.com/rutgersmobile/arc-unit-mocha"
license=('BSD3')
depends=('php' 'python' 'arcanist-git')
optdepends=('git: Git VCS support'
            'subversion: Subversion VCS support'
            'mercurial: Mercurial VCS support')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/rutgersmobile/arc-unit-mocha.git")
sha256sums=('SKIP')

package() {
  install -d "$pkgdir/usr/share/php/$_pkgname/"
  cp -a $_pkgname/* "$pkgdir/usr/share/php/$_pkgname/"
}
