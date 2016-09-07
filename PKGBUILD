# Maintainer: Oskari Rauta <oskari.rauta@gmail.com>

pkgname=tint2-improved
_pkgname=tint2
_gitver=5e231842fafc40282cd69ca3fcafa1af0a66b27b
pkgrel=1
pkgver="0.12.12"
pkgdesc="Tint2 with support for gradient backgrounds and separator plugins"
arch=('i686' 'x86_64')
url="https://gitlab.com/oskarirauta/tint2"
license=('GPL')
depends=('gtk2' 'imlib2' 'startup-notification')
makedepends=('cmake')
install=${pkgname}.install
provides=('tint2')
conflicts=('tint2' 'tint' 'tint2-svn' 'tint2-git')
source=("https://gitlab.com/oskarirauta/tint2/repository/archive.tar.gz?ref=$_gitver")
md5sums=('bb0eef013fe807ba51c822794a231b43')

prepare() {
 cd "$srcdir"
 mv "$_pkgname-$_gitver-$_gitver" "$_pkgname"
}

build() {
 cd "$srcdir/$_pkgname"
 cmake . -DCMAKE_INSTALL_PREFIX=/usr 
 make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
