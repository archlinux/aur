# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juan Pablo Gonzalez Tognarelli <lord_jotape@yahoo.com.ar>

pkgname=uriparser
pkgver=0.8.5
pkgrel=1
pkgdesc='uriparser is a strictly RFC 3986 compliant URI parsing library. uriparser is cross-platform, fast, supports Unicode'
url='https://github.com/uriparser/uriparser'
makedepends=('doxygen' 'graphviz')
arch=('x86_64')
license=('custom')
source=("https://github.com/uriparser/uriparser/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('58eacd5c03d9e341c04eb0b30831faec89f3b415949ff8d72254e63432352cdd')

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
