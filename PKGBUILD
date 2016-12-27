# Maintainer:  Ilya Terentyev <bacondropped@gmail.com>
# Contributor: Zachary Lund <admin@computerquip.com>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Michael P <ptchinster@archlinux.us>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Will Chappell <mr.chapendi@gmail.com>
# Contributor: Jesse Young <jesse.young@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=ragel-dev
pkgver=7.0.0.9
pkgrel=1
pkgdesc="Compiles finite state machines from regular languages into executable C, C++, Objective-C, C#, ASM, D, Go, Java, Ruby, OCaml, Crack, Rust or Julia code."
arch=('i686' 'x86_64')
url="http://www.complang.org/ragel/"
license=('GPL')
makedepends=('colm-dev>=0.13' 'kelbt')
depends=('gcc-libs')
conflicts=('ragel')
source=("https://www.colm.net/files/ragel/ragel-$pkgver.tar.gz")
md5sums=('29a4d8ced2f229966317d123a2d5af8a')

build() {
  cd "$srcdir/ragel-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/ragel-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -m0644 -D ragel.vim "$pkgdir"/usr/share/vim/vimfiles/syntax/ragel.vim
}
