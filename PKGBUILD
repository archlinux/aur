# Maintainer: aksr <aksr at t-com dot me>
pkgname=libmpq-git
pkgver=0.4.2.r76.g707e6f7
pkgrel=1
epoch=
pkgdesc="A library for reading MPQ files (archives used by Blizzard) which can be easily used in applications."
arch=('i686' 'x86_64')
url="https://github.com/ge0rg/libmpq"
license=('GPLv2')
groups=()
depends=('zlib')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('libmpq')
replaces=()
backup=()
options=(!libtool)
changelog=
install=
source=("$pkgname::git+https://github.com/ge0rg/libmpq.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/^[a-z]*-//;s/-/.r/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  export PYTHON=python2
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

