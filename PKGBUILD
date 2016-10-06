# Maintainer: YOUNG HO CHA <ganadist@gmail.com>
pkgname=uftrace
_commit=cc8fd74
_commit=c47bb75
pkgver=0.6+$_commit
pkgrel=0
pkgdesc="Tool to trace and analyze execution of a program written in C/C++"
arch=(arm x86_64)
url="https://github.com/namhyung/uftrace"
license=('GPL2')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
changelog=
#source=("git+https://github.com/namhyung/$pkgname.git#commit=$_commit")
source=("git+https://github.com/ganadist/$pkgname.git#commit=$_commit")
noextract=()
md5sums=('SKIP') #autofill using updpkgsums

build() {
  mkdir -p "$pkgname"/build
  cd "$pkgname"/build
  ../configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"/build
  make DESTDIR="$pkgdir/" install
}
