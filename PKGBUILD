# Maintainer: wangjiezhe <wangjiezhe AT yandex DOT com>

pkgname=shc-git
_pkgname=shc
pkgver=4.0.3
pkgrel=1
pkgdesc="A generic shell script compiler."
arch=('any')
url="https://github.com/neurobin/shc"
license=('GPLv3')
provides=("shc")
conflicts=("shc")
source=("$_pkgname::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/-/./g'
}

build() {
  cd $_pkgname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir/" install
}
