# Maintainer: aksr <aksr at t-com dot me>
pkgname=rq-git
pkgver=1.0.1.r4.g5d100b0
pkgrel=2
epoch=
pkgdesc="Read plain-text files in blazing speed"
arch=('i686' 'x86_64')
url="https://github.com/maandree/rq"
license=('MIT')
groups=()
depends=()
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/maandree/rq.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

