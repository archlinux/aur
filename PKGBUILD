# Maintainer: Daniel Hillenbrand <codeworkx at bbqlinux dot org>

_gitname=VectorChord
pkgname=vectorchord-immich-bin
pkgver=0.4.3
pkgrel=2
pkgdesc="VectorChord Scalable, fast, and disk-friendly vector search in Postgres, the successor of pgvecto.rs.version ncomptible with immich "
arch=('x86_64')
url="https://github.com/tensorchord/VectorChord"
license=('AGPLv3')
depends=('postgresql' 'pgvector')
provides=("vectorchord=$pkgver")
conflicts=('vectorchord-git' 'vectorchord-bin')
source=("${url}/releases/download/${pkgver}/postgresql-17-vchord_${pkgver}_${arch}-linux-gnu.zip")
sha256sums=('a1d1a4c86d9ca42202a1e07178d245e24313079e4b8b47132825287e4ff17322')



package() {
  install -Dm 755 $srcdir/pkglibdir/vchord.so $pkgdir$(pg_config --pkglibdir)/vchord.so
  install -d $pkgdir$(pg_config --sharedir)/extension
  install -m 755 $srcdir/sharedir/extension/vchord--* $pkgdir$(pg_config --sharedir)/extension/
  install -Dm 755 $srcdir/sharedir/extension/vchord.control $pkgdir$(pg_config --sharedir)/extension/vchord.control

}
