# Maintainer: aksr <aksr at t-com dot me>
pkgname=wordgrinder-git
pkgver=0.7.1.r13.ge81cb70
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
makedepends=('git' 'ninja')
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

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 licenses/COPYING.WordGrinder $pkgdir/usr/share/licenses/${pkgname%-*}/COPYING
}

