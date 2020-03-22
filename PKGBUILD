# Maintainer: Fernando Ortiz <nandub+arch [at] nandub.info>

_pkgname=adns
pkgname=adns-git
epoch=1
pkgver=adns.r1.5.1
pkgrel=2
pkgdesc="An asyncronous replacement resolver library"
arch=('i686' 'x86_64')
url="https://www.chiark.greenend.org.uk/~ian/adns"
license=('GPL')
depends=('glibc')
makedepends=('git')
source=("${_pkgname}::git://git.chiark.greenend.org.uk/~ianmdlvl/${_pkgname}.git")
sha1sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed 's/^v//; s/-/.r/; s/-/./g'
}

prepare() {
  cd ${_pkgname}
  ./configure --prefix=/usr
}

build() {
  cd ${_pkgname}
  make
}

package() {
  cd ${_pkgname}
  mkdir -p "$pkgdir"/usr/{lib,include,bin}
  make prefix="$pkgdir"/usr install
}

# vim: set ts=2 sw=2 et:
