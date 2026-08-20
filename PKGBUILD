# Maintainer: Liam Rooney <liam@roon.dev>

pkgname=plasma6-applets-codexbar
_pkgname=codexbar-plasmoid
_plasmoid=com.github.psimaker.codexbar
pkgver=0.3.1
pkgrel=1
pkgdesc="AI coding provider usage in your KDE Plasma 6 panel, a Plasma port of CodexBar"
arch=('any')
url="https://github.com/psimaker/codexbar-plasmoid"
license=('MIT')
depends=('libplasma' 'plasma5support' 'ksvg' 'kcmutils' 'kirigami' 'qt6-declarative'
         'codexbar-cli')
install="$pkgname.install"
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1f37a91641ae5075c0a8993d51e7d37e073070c170e7ebdf5250ea84b64bd657')

package() {
  cd "$_pkgname-$pkgver"

  local _dest="$pkgdir/usr/share/plasma/plasmoids/$_plasmoid"
  install -dm755 "$_dest"
  cp -a contents "$_dest/"
  install -Dm644 metadata.json "$_dest/metadata.json"
  find "$_dest/contents" -type d -exec chmod 755 {} +
  find "$_dest/contents" -type f -exec chmod 644 {} +

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
