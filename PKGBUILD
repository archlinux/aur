# Contributor: Bryan Ischo <bryan@ischo.com>
pkgname=libs3-git
_gitname=libs3
pkgver=184.bc58960
pkgrel=1
pkgdesc="C Library and Tools for Amazon S3 Access"
arch=('i686' 'x86_64')
url="https://github.com/bji/libs3"
license=('GPL')
groups=()
depends=('libxml2' 'openssl' 'curl')
makedepends=('make' 'libxml2' 'openssl' 'curl')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("git://github.com/bji/${_gitname}.git")
noextract=()
md5sums=('SKIP')


pkgver() {
  cd "$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$_gitname"
  DESTDIR=$pkgdir/usr make install || return 1
}
