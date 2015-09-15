# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=ttf2cxf
pkgver=0.0.0.1
pkgrel=1
pkgdesc="Converts ttf fonts to xcf"
url="https://github.com/Ultimaker/libArcus"
arch=('i686' 'x86_64')
license=('unknown')
depends=('freetype2' 'python-protobuf3')
source=(ftp://ribbonsoft.com/archives/ttf2cxf/ttf2cxf-0.0.0.1-src.tar.gz need_math.patch)
md5sums=('3388e3a52b7a8f692c9af1510dda6031'
         '66aa899fccdabc54363b13a7eb23edd9')

prepare() {
  cd ${pkgname}-${pkgver}-src
  patch < ../need_math.patch
}

build() {
  cd ${pkgname}-${pkgver}-src
  make
}

package() {
  cd ${pkgname}-${pkgver}-src
  install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
  cd "$pkgdir/usr/bin/"
  ln -s ${pkgname} ${pkgname}_stream
}

# vim:set ts=2 sw=2 et:
