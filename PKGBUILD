# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bibata-material-cursor-theme-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Bibata cursor themes using Material Design 3's tonal color system"
arch=('any')
url="https://github.com/SakibShahariar/material-bibata-cursor"
license=('MIT')
depends=('adwaita-cursors')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
source=("$url/releases/download/v$pkgver/bibata-material-dark-v$pkgver.tar.gz"
       "$url/releases/download/v$pkgver/bibata-material-light-v$pkgver.tar.gz"
        "LICENSE-upstream::https://raw.githubusercontent.com/SakibShahariar/material-bibata-cursor/refs/tags/v$pkgver/LICENSE")
sha256sums=('8a0cfddd60787c65a078ce494b5708c1d68f3e576118fde0701949edb40cba04'
            'db8e41025be52abd211de6485cb12b411058f7de811216bc0f495c7b04a1364b'
            'f2088b19938f1e5a3e1049cf141130b410af889526c118898b80be581d7d926d')

package() {
  install -d "$pkgdir/usr/share/icons"
  cp -a "bibata-material-dark-v$pkgver"/* "$pkgdir/usr/share/icons/"
  cp -a "bibata-material-dark-v$pkgver"/* "$pkgdir/usr/share/icons/"

  # Correct directory permissions
  find "${pkgdir}" -type d -exec chmod -R 755 {} \;

  install -Dm644 "$srcdir/LICENSE-upstream" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
