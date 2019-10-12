# Maintainer: aksr <aksr at t-com dot me>
pkgname=utmp-git
pkgver=r19.694c4dd
pkgrel=1
epoch=
pkgdesc="A small program which updates the utmp record of the current tty."
arch=('i686' 'x86_64')
url="http://git.suckless.org/utmp/"
license=('MIT')
groups=()
depends=()
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('utmp')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+git://git.suckless.org/utmp")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./configure
  sed -i 's/\/usr\/local/\/usr/' config.mk
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

