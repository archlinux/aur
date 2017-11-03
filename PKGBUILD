# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
pkgname=gifski
pkgver=0.1.0
pkgrel=1
pkgdesc="GIF encoder based on libimagequant (pngquant, gifquant?). Squeezes maximum possible quality from the awful GIF format"
arch=('i686' 'x86_64')
url="https://github.com/phw/peek"
license=('AGPL3')
makedepends=(rust)
source=(${pkgname}-${pkgver}::https://github.com/ImageOptim/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('ed51954e3632769598b55443b3dced10a9128421538387cf6b9d50f823aa7a77')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/gifski "$pkgdir/usr/bin/gifski"
}
