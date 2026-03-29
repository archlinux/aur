# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=librewolf-extension-darkreader
pkgname=$_pkgname-bin
pkgver=4.9.123
pkgrel=1
pkgdesc='Dark mode for every website. Take care of your eyes, use dark theme for night and daily browsing (binary release)'
url="https://github.com/darkreader/darkreader"
arch=('any')
license=('MIT')
depends=('librewolf')
provides=("$_pkgname")
conflicts=("$_pkgname")
groups=('librewolf-addons')
noextract=("darkreader-$pkgver.xpi")
source=("darkreader-$pkgver.xpi::$url/releases/download/v$pkgver/darkreader-firefox.xpi"
        "$url/raw/ccaed0c08ca9eb422ae33a1402a9892a18af3929/LICENSE")
sha256sums=('51c16cde85e7d1c2d6d162c3f5ae262379cd687dac83e3ed5feb550a32fff14f'
            'f0a5f835174494f8981b2cbb1a34054d4f887a5c865318650d6a17afe1c7850e')

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 darkreader-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/addon@darkreader.org.xpi"
}
