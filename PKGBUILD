# Maintainer: Daniel Hillenbrand <codeworkx at bbqlinux dot org>

_gitname=pgvecto.rs
pkgname=pgvecto.rs-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="pgvector binaries"
arch=('x86_64')
url="https://github.com/tensorchord/pgvecto.rs"
license=('Apache')
depends=('postgresql')
conflicts=('pgvector')

source=("${url}/releases/download/v${pkgver}/vectors-pg16_${arch}-unknown-linux-gnu_${pkgver}.zip")
sha256sums=('SKIP')



package() {
  install -Dm 755 $srcdir/vectors.so $pkgdir$(pg_config --pkglibdir)/vectors.so
  install -d $pkgdir$(pg_config --sharedir)/extension
  install -m 755 $srcdir/vectors--* $pkgdir$(pg_config --sharedir)/extension/
  install -Dm 755 $srcdir/vectors.control $pkgdir$(pg_config --sharedir)/extension/vectors.control

}
