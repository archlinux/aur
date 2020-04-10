# Maintainer: Jonathan Kotta <jpkotta@gmail.com>

pkgname=phytool
pkgver=2
pkgrel=1
pkgdesc="MDIO register access"
arch=("x86_64")
url="https://github.com/wkz/phytool"
license=('GPL')
depends=('glibc')
makedepends=()
source=("https://github.com/wkz/phytool/releases/download/v${pkgver}/phytool-${pkgver}.tar.xz")
md5sums=('972982f8e5f7237cbccfc6d275da7348')

build() {
  cd "phytool-$pkgver"
  make
}

package() {
  cd "phytool-$pkgver"
  prefix=usr
  install -d -m 755 "$pkgdir/$prefix/bin"
  make PREFIX="$prefix" DESTDIR="$pkgdir/" install
}
