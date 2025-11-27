# Maintainer: Daniel Hillenbrand <codeworkx at bbqlinux dot org>

_gitname=VectorChord
pkgname=vectorchord-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="VectorChord Scalable, fast, and disk-friendly vector search in Postgres, the successor of pgvecto.rs. "
arch=('x86_64')
url="https://github.com/tensorchord/VectorChord"
license=('AGPLv3')
depends=('postgresql' 'pgvector')
provides=("vectorchord=$pkgver")
source=("${url}/releases/download/${pkgver}/postgresql-18-vchord_${pkgver}_${arch}-linux-gnu.zip")
sha256sums=('73fb60bf8b0e2c1bb4df700fa5400d3f2819482e0b7dbdc7e2e88212efff1819')



package() {
  install -Dm 755 $srcdir/pkglibdir/vchord.so $pkgdir$(pg_config --pkglibdir)/vchord.so
  install -d $pkgdir$(pg_config --sharedir)/extension
  install -m 755 $srcdir/sharedir/extension/vchord--* $pkgdir$(pg_config --sharedir)/extension/
  install -Dm 755 $srcdir/sharedir/extension/vchord.control $pkgdir$(pg_config --sharedir)/extension/vchord.control

}
