# Maintainer: aksr <aksr at t-com dot me>
pkgname=avcut-git
pkgver=0.3.r15.g8be229a
pkgrel=1
epoch=
pkgdesc="Frame-accurate video cutting with only small quality loss"
arch=('i686' 'x86_64')
url="https://github.com/anyc/avcut"
license=('GPL')
categories=()
groups=()
depends=()
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('avcut')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/anyc/avcut.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/share/doc/${pkgname%-*}
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

