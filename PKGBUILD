# Maintainer: aksr <aksr at t-com dot me>
pkgname=neateqn-git
pkgver=r87.592804e
pkgrel=1
epoch=
pkgdesc="An eqn preprocessor for neatroff."
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir/"
license=('ISC')
groups=()
depends=('neatroff-git')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('neateqn')
conflicts=('neateqn')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git://repo.or.cz/neateqn.git"
        "http://litcave.rudi.ir/neateqn.pdf")
noextract=()
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd $srcdir/$pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$pkgname
  make all
}

package() {
  cd $srcdir
  install -Dm755 $pkgname/eqn $pkgdir/usr/bin/neateqn
  install -Dm644 $pkgname/README $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -Dm644 neateqn.pdf $pkgdir/usr/share/doc/${pkgname%-*}/neateqn.pdf
}

