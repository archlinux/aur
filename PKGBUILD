# Maintainer: aksr <aksr at t-com dot me>
pkgname=wordgrinder-git
pkgver=0.6.r7.g0e2b004
pkgrel=1
epoch=
pkgdesc="A word processor which gets the hell out of your way and lets you get some work done."
arch=('i686' 'x86_64')
url="https://github.com/davidgiven/wordgrinder"
url="http://cowlark.com/wordgrinder"
license=('MIT')
categories=()
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/davidgiven/wordgrinder.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX="$pkgdir/usr" install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/COPYING
}

