# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=librewolf-extension-darkreader
pkgname=$_pkgname-bin
pkgver=4.9.119
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
        "https://github.com/darkreader/darkreader/raw/main/LICENSE")
sha256sums=('da74ef0d83981d07035d20d49effdfffa5fe5a56b35370bbe62c73c2ebc9a71f'
            'f0a5f835174494f8981b2cbb1a34054d4f887a5c865318650d6a17afe1c7850e')

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 darkreader-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/addon@darkreader.org.xpi"
}
