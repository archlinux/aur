# Author: Maxime “pep” Buquet <archlinux@bouah.net>

# There is no versioning in-repo, although there is some upon import into the
# lerger repo https://github.com/google/fonts. For example:
# https://github.com/google/fonts/commit/568985dba2cc5bf58d9f59af93fd5a5faea610ff

_pkgbase=karla
_commit=1bd63a928e0f1122373b2a3dfe6c82cdb20569b3
pkgname=ttf-karla
pkgver=2.002
pkgrel=2
epoch=1
pkgdesc="Grotesque Sans Serif Latin typeface"
arch=('any')
license=('custom:OFL')
url=https://fonts.google.com/specimen/Karla
source=("$_pkgbase-$_commit.tar.gz::https://github.com/googlefonts/karla/archive/$_commit.tar.gz")
sha512sums=('3d8ea03a7e6530ede46e27f261639b105fd5c5c5e3108b98f982271479f29b0d2b47c0e7e2c6f941e742767382f0814d6e472bf28ff7d4b1419f316bc1714516')
provides=(ttf-font)

package() {
  cd "$srcdir/$_pkgbase-$_commit"

  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -m644 fonts/ttf/static/Karla-{Bold,ExtraBold,ExtraLight,Light,Medium,Regular}.ttf "$pkgdir/usr/share/fonts/TTF"
  install -D -m644 OFL.txt "$pkgdir/usr/share/licenses/ttf-karla/LICENSE"
}
