# Rappel Assembly REPL

# Maintainer: Dmitry Kudriavtsev <me@dk0.us>
pkgname=rappel-git
pkgver=r26.a969940
pkgrel=1
epoch=
pkgdesc="A pretty janky assembly REPL"
arch=(i686 x86_64 armv7h)
url="https://github.com/yrp604/rappel"
license=('BSD')
groups=()
depends=(libedit nasm binutils gcc)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("rappel::git+https://github.com/yrp604/rappel")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

pkgver() {
  cd rappel
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd rappel
  make
}

package() {
  mkdir -p $pkgdir/usr
  mv $srcdir/rappel/bin $pkgdir/usr
}
