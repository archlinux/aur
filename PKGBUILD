# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatcc-git
pkgver=r310.e2682e7
pkgrel=1
epoch=
pkgdesc="A simple ARM/x86(_64) C compiler."
arch=('i686' 'x86_64')
url="http://repo.or.cz/w/neatcc.git"
license=('custom:BSD')
groups=()
depends=('')
makedepends=('git')
optdepends=('neatas-git: A small ARM assembler'
            'neatlibc-git: A small ARM/x86(_64) libc'
            'neatld-git: A simple ARM/x86(_64) static linker')
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+git://repo.or.cz/neatcc.git#branch=master")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 ncc $pkgdir/usr/bin/ncc
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
}

