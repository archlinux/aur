# Maintainer: 2ion
pkgname=avdump2-bin
pkgver=6714
pkgrel=3
pkgdesc="AniDB video/audio codec identification utility (command line version)"
arch=('any')
url="https://wiki.anidb.net/w/Avdump2"
license=('UNKNOWN')
depends=('mono')
makedepends=('unrar')
provides=('avdump2')
_archive="avdump2_${pkgver}.rar"
source=("https://static.anidb.net/client/avdump2/${_archive}" \
        'avdump2')
noextract=("$_archive")
sha512sums=('d4714f2d5599437b6cf9fdb52da21104e26b031231c2fd937579ed14835b9baa3bc2495b68324e82f7f9c148b4f8df5b7a2fb831d939be7db1e6263aa3814338' \
            'SKIP')

prepare() {
  cd "$srcdir"
  unrar e "$_archive" "./$pkgver/"
}

package() {
  cd "$srcdir/$pkgver"
  install -m 755 -d "$pkgdir"/opt/avdump2
  install -m 644 -t "$pkgdir"/opt/avdump2 -- *
  install -Dm 755 "$srcdir"/avdump2 "$pkgdir"/usr/bin/avdump2
}
