# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

_pkgname=img4tool
pkgname=$_pkgname-git
pkgver=r162.d514ce5
pkgrel=1
pkgdesc='Tool for manipulating IMG4, IM4M and IM4P files'
arch=('x86_64')
url="https://github.com/tihmstar/$_pkgname"
license=('LGPL3')
depends=('libgeneral' 'libplist' 'openssl')
makedepends=('git' 'lzfse')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir/" install
}
