# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=silentdragon-bin
_pkgname="${pkgname%-bin}"
pkgver=1.4.4
pkgrel=1
pkgdesc='HUSH (Privacy Cryptocurrency) desktop full node GUI wallet that supports z-addresses'
url='https://git.hush.is/hush/silentdragon'
arch=('x86_64')
license=('GPL-3.0-or-later')
makedepends=('curl' 'wget')
provides=('silentdragon')
conflicts=('silentdragon')
source=("$_pkgname-$pkgver-amd64.deb::https://git.hush.is/attachments/da649136-042c-4ace-b97d-c1b510b9b843"
        "$url/raw/branch/master/LICENSE")
sha512sums=('d4814df021bb34469b29e397216481899b90f9556a5f6e513acfc995206a40b36335e56b0cb2595e9fc46e6e637b54399cd9fdb7aae1bc246334515f643e9554'
            '2d3eac468855f3b7d5cec91c7af8119ba15b7c5f634642f4e10a7c69ab08f32d40b12eab8986cc8dbc80cbcd3d6697159723a25e56915f66ea50179caae69553')

package() {
  # extract from deb file
  tar -xf "$srcdir/data.tar.xz"

#  install="$_pkgbase.install"
  install -Dm755 "$srcdir/usr/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "$srcdir/usr/share/applications/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$srcdir/usr/share/pixmaps/$_pkgname.xpm" "$pkgdir/usr/share/pixmaps/$_pkgname.xpm"
}
