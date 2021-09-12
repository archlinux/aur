# Maintainer: Morgan Hager <morgan dot hager one at gmail dot com>

pkgname=clhs
pkgver=7.0
_pkgver=7-0
pkgrel=2
pkgdesc="A local copy of the Common Lisp HyperSpec"
url="http://www.lispworks.com/documentation/common-lisp.html"
arch=('any')
license=('custom')
depends=()
source=("http://ftp.lispworks.com/pub/software_tools/reference/HyperSpec-${_pkgver}.tar.gz")
sha256sums=('1ac1666a9dc697dbd8881262cad4371bcd2e9843108b643e2ea93472ba85d7c3')
# Do not extract the archive as its files are not all in one directory
noextract=("HyperSpec-${_pkgver}.tar.gz")

package() {
  mkdir -p "$pkgdir/usr/share/doc/clhs"
  tar -xf "$srcdir/HyperSpec-${_pkgver}.tar.gz" -C "$pkgdir/usr/share/doc/clhs"

  chown -R root:root "$pkgdir/usr/share/doc/clhs"
  chmod -R a=rX "$pkgdir/usr/share/doc/clhs"
}
