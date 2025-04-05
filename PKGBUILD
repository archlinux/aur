# Maintainer: aarto <aarto@aur.archlinux.org>

_pkgname_suffix=extension-linkding
_firefox_pkgname=firefox-$_pkgname_suffix
_librewolf_pkgname=librewolf-$_pkgname_suffix
_id='{b86e4813-687a-43e6-ab65-0bde4ab75758}'
pkgname=("$_librewolf_pkgname-bin" "$_firefox_pkgname-bin")
pkgver=1.14.0
pkgrel=1
pkgdesc="Companion extension for the self-hosted linkding bookmark service"
url=https://github.com/sissbruecker/linkding-extension
arch=('any')
license=('MIT')
noextract=("$_id.xpi")
_number=4449452
source=("$_id.xpi::https://addons.mozilla.org/firefox/downloads/file/$_number/linkding_extension-$pkgver.xpi"
        'https://raw.githubusercontent.com/sissbruecker/linkding-extension/refs/heads/master/LICENSE.txt')
b2sums=('2b0865caaf599d479ddce8e549d5ab0ee610ba11d6529497b2e02758a9d9e48d138dcf69184bfde589847594ba8007a8621f220555996e4aa82bee58189190dd'
        'af4ab5e0e01d2fb2533f8e16b636b8d73217f084631785c0427d5bf97427c6e9ff5af0530df123e64d3f048a3e80d061562ca978f35eb9bc640e904ddb295ae8')

_package() {
  depends=("$1")
  provides=("$1-$_pkgname_suffix")
  conflicts=("$1-$_pkgname_suffix")
  groups=("$1-addons")
  install -Dm644 $_id.xpi "$pkgdir/usr/lib/$1/browser/extensions/$_id.xpi"
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$1-$_pkgname_suffix-bin"
}

package_firefox-extension-linkding-bin() {
  _package firefox
}

package_librewolf-extension-linkding-bin() {
  _package librewolf
}
