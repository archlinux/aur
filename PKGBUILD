# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=librewolf-extension-darkreader
pkgname=$_pkgname-bin
pkgver=4.9.118
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
sha256sums=('0159805a4fe30b3df60feb7cb9dbddf6af1eba18f0dfeb5ee8572bccab9c3c5c'
            'a9c57a1a33a7f5ebabf3495e11de3b6e92c70f68dcec75b529f6ab4bfb223f5a')

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 darkreader-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/addon@darkreader.org.xpi"
}
