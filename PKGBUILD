# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bibata-material-cursor-theme-bin
pkgver=1.4.0
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
sha256sums=('df68e79ef7a0cb87fc0a45adcce4f9c2ed2fe8f89f617459f26357ec5c8d8c78'
            '8774d79a174aa6dd9a772454740eac582990eafd866d03f6432be95bcce0a863'
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
