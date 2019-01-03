# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juan Pablo Gonzalez Tognarelli <lord_jotape@yahoo.com.ar>

pkgname=uriparser
pkgver=0.9.1
pkgrel=1
pkgdesc='uriparser is a strictly RFC 3986 compliant URI parsing library. uriparser is cross-platform, fast, supports Unicode'
url='https://github.com/uriparser/uriparser'
makedepends=('doxygen' 'graphviz')
arch=('x86_64')
license=('custom')
source=("https://github.com/uriparser/uriparser/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('75248f3de3b7b13c8c9735ff7b86ebe72cbb8ad043291517d7d53488e0893abe')

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
