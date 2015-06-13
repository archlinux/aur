# Maintainer: Johan Rehnberg <cleanrock@gmail.com>
pkgname=pr-downloader-git
pkgver=0.7.176.gdfb39db
pkgrel=1
pkgdesc="spring download tool"
arch=('i686' 'x86_64')
url="https://github.com/spring/pr-downloader"
license=('GPL-2')
groups=()
depends=('curl')
makedepends=('git' 'cmake')
optdepends=()
provides=('pr-downloader')
conflicts=('pr-downloader' 'spring')
replaces=()
backup=()
options=()
install=
source=('git://github.com/spring/pr-downloader.git')
noextract=()
md5sums=('SKIP')

_gitname=pr-downloader

pkgver() {
  cd "$srcdir/$_gitname"
  # package version is Tag.CommitsSinceTag.CommitId, e.g 0.2.0.gab34413
  git describe --long | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_gitname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
