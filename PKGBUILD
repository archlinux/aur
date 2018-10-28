# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juan Pablo Gonzalez Tognarelli <lord_jotape@yahoo.com.ar>

pkgname=uriparser
pkgver=0.9.0
pkgrel=1
pkgdesc='uriparser is a strictly RFC 3986 compliant URI parsing library. uriparser is cross-platform, fast, supports Unicode'
url='https://github.com/uriparser/uriparser'
makedepends=('doxygen' 'graphviz')
arch=('x86_64')
license=('custom')
source=("https://github.com/uriparser/uriparser/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('ec67eb34feda8eac166f281799f03ed48387694fca44f6f5852f61f8fb535e2c')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --disable-test
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  install -D -m0644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
