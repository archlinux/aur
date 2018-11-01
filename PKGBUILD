# Maintainer: Sebastian Oechsle <setboolean@icloud.com>
pkgname=afpfsng_git
pkgver=f6e24eb
pkgrel=1
pkgdesc="Fork of afpfs-ng that adds IPv6 support and several performance and stability improvements."
arch=('x86_64')
url="https://github.com/simonvetter/afpfs-ng"
license=('GPL3')
groups=()
depends=('fuse3' 'libgcrypt')
optdepends=()
makedepends=('git')
provides=("afpfs-ng")
conflicts=("afpfs-ng")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/simonvetter/afpfs-ng.git')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/afpfs-ng"
  git describe --always
}

build() {
	cd "$srcdir/afpfs-ng"
	./configure
	make
}

package() {
	cd "$srcdir/afpfs-ng"
	make DESTDIR="$pkgdir/" prefix="/usr/" install
}

