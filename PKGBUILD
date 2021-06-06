# Maintainer: Husam Bilal <me@husam.dev>
# Contributor: Doug Newgard <scimmia@archlinux.info>
# Contributor: Sergio Correia <sergio@correia.cc>
# Contributor: Nicolas Vivet <nizzox@gmail.com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

_pkgname=arcanist
pkgname="${_pkgname}-stable-git"
pkgver=r2388.ccd39feb
pkgrel=1
pkgdesc='The command line interface for Phabricator'
arch=('any')
url='https://www.phacility.com/phabricator/arcanist'
license=('Apache')
depends=('libphutil' 'php7' 'python')
optdepends=('git: Git VCS support' 'subversion: Subversion VCS support' 'mercurial: Mercurial VCS support')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=('git+https://github.com/phacility/arcanist.git#branch=stable')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "$pkgdir/usr/share/php/$_pkgname/" "$pkgdir/usr/bin/"
  cp -a $_pkgname/* "$pkgdir/usr/share/php/$_pkgname/"
  ln -s "../share/php/$_pkgname/bin/arc" "$pkgdir/usr/bin/arc"
}
