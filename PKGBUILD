# Maintainer: Daniel Hillenbrand <codeworkx at bbqlinux dot org>

_gitname=VectorChord
pkgname=vectorchord-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="VectorChord Scalable, fast, and disk-friendly vector search in Postgres, the successor of pgvecto.rs. "
arch=('x86_64')
url="https://github.com/tensorchord/VectorChord"
license=('AGPLv3')
depends=('postgresql')

source=("${url}/releases/download/${pkgver}/postgresql-17-vchord_${pkgver}_${arch}-linux-gnu.zip")
sha256sums=('f44f132577db5cf926a1c1efdee947750a4d6718f77e9ba057e24446d643b7ed')



package() {
  install -Dm 755 $srcdir/vchord.so $pkgdir$(pg_config --pkglibdir)/vchord.so
  install -d $pkgdir$(pg_config --sharedir)/extension
  install -m 755 $srcdir/vchord--* $pkgdir$(pg_config --sharedir)/extension/
  install -Dm 755 $srcdir/vchord.control $pkgdir$(pg_config --sharedir)/extension/vchord.control

}
