# Maintainer: Swift Geek <swiftgeek «at» gmail>

_pkgname=baidudl
pkgname=baidudl-git
pkgver=a
pkgrel=0
pkgdesc="multi-thread download tool for pan.baidu.com"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/yzfedora/baidudl"
license=('GPL')
depends=('glibc' 'curl')
source=( "git://github.com/yzfedora/baidudl.git#commit=aaf561609f5a4178f3278f797cdda09c0aaa9e68" )
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_pkgname}/"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_pkgname}/"
  make DESTDIR="${pkgdir}" install
}


