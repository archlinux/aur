# Maintainer: aksr <aksr at t-com dot me>
pkgname=unco-git
pkgver=0.2.0.6.g227a923
pkgrel=1
epoch=
pkgdesc="Undo any command."
arch=('i686' 'x86_64')
url="https://github.com/kazuho/unco"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'cmake')
optdepends=()
checkdepends=()
provides=('unco')
conflicts=('unco')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/kazuho/unco")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's|^v||;s|-|.|g'
}

build() {
  cd "$srcdir/$pkgname"
  cmake cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

