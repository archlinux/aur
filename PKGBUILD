pkgname=avdump2-bin
pkgver=7080
pkgrel=1
pkgdesc="AniDB video/audio codec identification utility (command line version)"
arch=('any')
url="https://wiki.anidb.net/w/Avdump2"
license=('UNKNOWN')
depends=('mono')
makedepends=('p7zip')
provides=('avdump2')
_archive="avdump2_${pkgver}.zip"
source=("https://static.anidb.net/client/avdump2/${_archive}" \
        'avdump2')
noextract=("$_archive")
sha256sums=('6ddcb341735b575ce204951b7b91465706c5d77e829284bdd551205e15abbf48' \
            'SKIP')

prepare() {
  cd "$srcdir"
  7za -o"./$pkgver" e "$_archive"
}

package() {
  cd "$srcdir/$pkgver"
  install -m 755 -d "$pkgdir"/opt/avdump2
  install -m 644 -t "$pkgdir"/opt/avdump2 -- *
  install -Dm 755 "$srcdir"/avdump2 "$pkgdir"/usr/bin/avdump2
}
