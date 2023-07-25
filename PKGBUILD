# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=libvarnam
pkgname=${_pkgname}-git
pkgver=r459.f32d681
pkgrel=1
pkgdesc="Transliteration and reverse transliteration for Indian languages - Git version"
arch=('x86_64')
url="https://www.varnamproject.com/"
license=('MPL')
makedepends=('cmake' 'git')
source=("git+https://github.com/varnamproject/libvarnam.git")
sha256sums=('SKIP')
depends=('ruby' 'ruby-ffi')
provides=('libvarnam')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgname}
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${_pkgname}
  make DESTDIR="$pkgdir/" install
}
