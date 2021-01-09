# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=libnsl-git
pkgver=1.3.0
pkgrel=1
pkgdesc='Public client interface library for NIS(YP) and NIS+'
arch=(x86_64)
url='https://github.com/thkukuk/libnsl'
license=('LGPL2.1')
depends=(libtirpc)
provides=(libnsl)
conflicts=(libnsl)
source=("git+https://github.com/thkukuk/libnsl.git")
#md5sums=('a7ab1d3e2a685edad1a55857bfccf318')

pkgver() {
  cd libnsl
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd libnsl
}

build() {
  cd libnsl
  ./autogen.sh
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd libnsl
  make DESTDIR="$pkgdir" install
}
