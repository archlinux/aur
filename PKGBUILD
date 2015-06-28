# Maintainer: aksr <aksr at t-com dot me>
pkgname=fbvnc-git
pkgver=0.r40.d1a3369
pkgrel=1
epoch=
pkgdesc="A small framebuffer vnc viewer."
arch=('i686' 'x86_64')
url="http://repo.or.cz/w/fbvnc.git"
license=('custom:BSD')
groups=()
depends=('')
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
source=("$pkgname::git+git://repo.or.cz/fbvnc.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$pkgname
  make
}

package() {
  cd $srcdir/$pkgname
  install -Dm755 fbvnc $pkgdir/usr/bin/fbvnc
}

