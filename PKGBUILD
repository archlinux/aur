# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=librewolf-extension-darkreader
pkgname=$_pkgname-bin
pkgver=4.9.105
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
sha256sums=('b4aa6902938500fdb53de917272fb8c1f476783a8877c9515b3b06be5b88e4a0'
            'a9c57a1a33a7f5ebabf3495e11de3b6e92c70f68dcec75b529f6ab4bfb223f5a')

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 darkreader-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/addon@darkreader.org.xpi"
}
