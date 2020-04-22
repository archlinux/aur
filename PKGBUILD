# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname=qrcodegen
pkgver=1.6.0
pkgrel=2
pkgdesc="High-quality QR Code generator library"
url="https://www.nayuki.io/page/qr-code-generator-library"
license=('MIT')
arch=('x86_64')
source=("https://github.com/nayuki/QR-Code-generator/archive/v${pkgver}.tar.gz")
downname="QR-Code-generator-${pkgver}"

build() {
  cd "${downname}/c"
  make
}

package() {
  mkdir -p "$pkgdir/usr/include/qrcodegen"
  mkdir -p "$pkgdir/usr/lib"
  cp "${srcdir}/${downname}"/c/*.a "$pkgdir/usr/lib/"
  cp "${srcdir}/${downname}"/c/*.h "$pkgdir/usr/include/qrcodegen/"
}

sha256sums=('8acee5a77325e075b910747ad4b1fdb1491b7e22d0b8f1b5a6ea15ea08ba33a8')
