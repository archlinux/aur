# Maintainer: soloturn@gmail.com

pkgname=cosmic-epoch-git
pkgver=0
pkgrel=1
pkgdesc="pop-os cosmic desktop, version from git"
arch=('x86_64')
url="https://github.com/pop-os/cosmic-epoch"
license=('GPL')
depends=('gtk4')
makedepends=('just')
provides=('cosmic-epoch-git')

source=(
  'git+https://github.com/pop-os/cosmic-epoch'
)

md5sums=(
    'SKIP'
)

prepare() {
  cd "$srcdir"
  git submodule init
  git config submodule.libs/libdep.url "$srcdir/lib-dependency"
  git -c protocol.file.allow=always submodule update
}
