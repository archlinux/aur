# Maintainer: aksr <aksr at t-com dot me>
pkgname=rwc-git
pkgver=r9.227380d
pkgrel=1
epoch=
pkgdesc="Report when files change"
arch=('i686' 'x86_64')
url="https://github.com/chneukirchen/rwc"
license=('Public Domain')
categories=()
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
source=("$pkgname::git+https://github.com/chneukirchen/rwc.git")
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
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}

