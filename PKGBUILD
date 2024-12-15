# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=silentdragon-bin
_pkgname="${pkgname%-bin}"
pkgver=1.4.5
pkgrel=1
pkgdesc='HUSH (Privacy Cryptocurrency) desktop full node GUI wallet that supports z-addresses'
url='https://git.hush.is/hush/silentdragon'
arch=('x86_64')
license=('GPL-3.0-or-later')
makedepends=('curl' 'wget')
provides=('silentdragon')
conflicts=('silentdragon')
source=("$_pkgname-$pkgver-amd64.deb::https://git.hush.is/attachments/a2d8c2b9-67c4-4210-8b68-12c693c5260b"
        "$url/raw/branch/master/LICENSE")
sha512sums=('5faaff88755960d5c69521f6798711a486b319a2a33ccf6513d49401ac87b69574d571d86f8f534bc8f4922aac1c2b17ae93c128491440b3215cf3bf77004664'
            '2d3eac468855f3b7d5cec91c7af8119ba15b7c5f634642f4e10a7c69ab08f32d40b12eab8986cc8dbc80cbcd3d6697159723a25e56915f66ea50179caae69553')

package() {
  install="${pkgbase}.install"
  # extract from deb file
  tar -xf "$srcdir/data.tar.xz"

  install -Dm755 "$srcdir/usr/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "$srcdir/usr/share/applications/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$srcdir/usr/share/pixmaps/$_pkgname.xpm" "$pkgdir/usr/share/pixmaps/$_pkgname.xpm"
}
