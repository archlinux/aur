# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatpost-git
pkgver=0.r56.957e74b
pkgrel=1
epoch=
pkgdesc="Postscript postprocessor for neatroff."
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir/"
license=('custom:BSD')
groups=()
depends=('neatroff-git')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('neatpost')
conflicts=('neatpost')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git://repo.or.cz/neatpost.git")
noextract=()
md5sums=('SKIP')

## FONTS directory 
FDIR=/usr/share/neatroff/font

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make all FDIR=$FDIR
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 post $pkgdir/usr/bin/neatpost
}

