# Maintainer: aksr <aksr at t-com dot me>
pkgname=fontview-git
pkgver=r181.0a9e036
pkgrel=1
epoch=
pkgdesc="A simple font viewer."
arch=('i686' 'x86_64')
url="https://github.com/khaledhosny/fontview"
license=('GPLv2')
groups=()
depends=('gtk3' 'cairo' 'freetype2' 'harfbuzz' 'intltool')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git://github.com/khaledhosny/fontview.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

