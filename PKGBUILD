# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

_name=img4tool
pkgname=$_name-git
pkgver=r172.c1a0c04
pkgrel=1
pkgdesc='Tool for manipulating IMG4, IM4M and IM4P files'
arch=('x86_64')
url="https://github.com/tihmstar/$_name"
license=('LGPL3')
depends=('libgeneral' 'libplist' 'openssl')
makedepends=('git' 'lzfse')
provides=("$_name")
conflicts=("$_name")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"

  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_name"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$_name"

  make DESTDIR="$pkgdir/" install
}
