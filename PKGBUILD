# Maintainer: Martin Kostolný <clearmartin at zoho dot com>

pkgname=firefox-extension-unity-launcher-api-e10s
_gitpkgname=firefox-extension-unity-launcher-api-e10s
pkgver=1.1.5
_xpipkgname="unity_launcher_api_addon_e10s-$pkgver-an+fx-linux.xpi"
pkgrel=1
pkgdesc="Unity Launcher API add-on, compatible with e10s."
url="https://github.com/kotelnik/$_gitpkgname"
arch=('any')
license=('GPL3')
depends=('firefox' 'python3')
makedepends=('git')
source=(
    "https://addons.mozilla.org/firefox/downloads/file/824433/$_xpipkgname"
    "https://github.com/kotelnik/$_gitpkgname/archive/v$pkgver.tar.gz")
noextract=("$_xpipkgname")
sha512sums=(
    '477764dd18b4c441f1273427da5c2f24d77a004b1370f2da6a2f38b3c8be99d736a81d33680a513add712c6ca73f1ca1c4f71c1c66c5e5687b0b4d1403b2c546'
    '0bfdd033f363d1aa5dad0385a58f8901cc13a4c29286172e9968f58da3c512861e42ce2d8804073753ef7378850d72bb67bf4d5ec485b53a2236f44d7fba917b')

package() {
    install -Dm644 "$_xpipkgname" "$pkgdir/usr/lib/firefox/browser/extensions/firefox_extension_unity_launcher_api_e10s@kotelnik.xpi"
    install -Dm755 "$_gitpkgname-$pkgver/app-side/launcher_api_firefox_stdin.py" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/launcher_api_firefox_stdin.py"
    install -Dm644 "$_gitpkgname-$pkgver/app-side/launcher_api_firefox_stdin.py.json" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/launcher_api_firefox_stdin.py.json"
}
