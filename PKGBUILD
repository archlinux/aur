# Maintainer: Dave Reisner <d@falconindy.com>

pkgname=pkgbuild-introspection-git
_pkgname=pkgbuild-introspection
pkgver=9
pkgrel=1
pkgdesc='Tools for generating .SRCINFO files and PKGBUILD data extraction (mkaurball)'
url="https://github.com/falconindy/$_pkgname"
license=('MIT')
arch=('any')
depends=('bash' 'pacman')
makedepends=('git')
checkdepends=('python-srcinfo')
provides=('pkgbuild-introspection')
conflicts=('pkgbuild-reflection-git' 'pkgbuild-introspection')
source=("git://github.com/falconindy/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe | sed 's/^v//;s/-/./g'
}

build() {
  cd "$_pkgname"

  make
}

check() {
  cd "$_pkgname"

  make check
}

package() {
  cd "$_pkgname"

  make install PREFIX=/usr DESTDIR="$pkgdir"
}
