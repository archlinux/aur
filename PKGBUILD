# Maintainer: Daniel Hillenbrand <codeworkx at bbqlinux dot org>

_gitname=VectorChord
pkgname=vectorchord-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="VectorChord Scalable, fast, and disk-friendly vector search in Postgres, the successor of pgvecto.rs. "
arch=('x86_64')
url="https://github.com/tensorchord/VectorChord"
license=('AGPLv3')
depends=('postgresql' 'pgvector')
provides=("vectorchord=$pkgver")
source=("${url}/releases/download/${pkgver}/postgresql-18-vchord_${pkgver}_${arch}-linux-gnu.zip")
sha256sums=('5b2cfa6791af22b21f701bcdb63d65ea25a5c2fa1643009593b01d09de3d0193')



package() {
  install -Dm 755 $srcdir/pkglibdir/vchord.so $pkgdir$(pg_config --pkglibdir)/vchord.so
  install -d $pkgdir$(pg_config --sharedir)/extension
  install -m 755 $srcdir/sharedir/extension/vchord--* $pkgdir$(pg_config --sharedir)/extension/
  install -Dm 755 $srcdir/sharedir/extension/vchord.control $pkgdir$(pg_config --sharedir)/extension/vchord.control

}
