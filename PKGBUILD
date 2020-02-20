# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Florijan Hamzic <florijanh@gmail.com>

pkgname=python2-cairocffi
pkgver=0.9.0
pkgrel=1
pkgdesc="cairocffi is a CFFI-based drop-in replacement for Pycairo, a set of Python bindings and object-oriented API for cairo."
arch=(any)
url="https://cairocffi.readthedocs.io/"
license=(BSD)
depends=(python2-cffi cairo python2-xcffib)
makedepends=(python2-cffi python2-setuptools cairo python2-xcffib gdk-pixbuf2)
optdepends=('gdk-pixbuf2: for cairocffi.pixbuf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Kozea/cairocffi/archive/v${pkgver}.tar.gz")
sha512sums=('a1a4d2ccb5885798f8889bbc181f6325fc0fff88065d01dd1dc2936dbd5ac71e959bb28516864ffd9244de13fba87c2c99028cea708476e8cf378f5538f5496c')

build() {
  cd "${srcdir}/cairocffi-${pkgver}"
  
  python2 setup.py build
}

package() {
  cd "${srcdir}/cairocffi-${pkgver}"
  
  python2 setup.py install --root="${pkgdir}" --prefix=/usr -O1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
