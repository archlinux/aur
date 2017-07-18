# Maintainer: Martin Kostolný <clearmartin at zoho dot com>

pkgname=firefox-extension-unity-launcher-api-e10s
_gitpkgname=firefox-extension-unity-launcher-api-e10s
pkgver=1.1.4
_xpipkgname="unity_launcher_api_addon_e10s-$pkgver-an+fx-linux.xpi"
pkgrel=1
pkgdesc="Unity Launcher API add-on, compatible with e10s."
url="https://github.com/kotelnik/$_gitpkgname"
arch=('any')
license=('GPL3')
depends=('firefox' 'python3')
makedepends=('git')
source=(
    "https://addons.mozilla.org/firefox/downloads/file/678923/$_xpipkgname"
    "https://github.com/kotelnik/$_gitpkgname/archive/v$pkgver.tar.gz")
noextract=("$_xpipkgname")
sha512sums=(
    '87d525350097b65627fed31581f28b3ad87f8f9aadf7b1a42e4876e8cdbb25df6d18645dfa27ef2b8e842d5fc8796faa9eea56ca6895c268490b21cc1315b8fe'
    '1a8e9da2af7f139b937f9ceada9975840047e92fa964d608d77a0975aa781a3623cb57d222ca6350bddc152bcf11e6c83f3c171c06775e0fe04703bffe92754d')

package() {
    install -Dm644 "$_xpipkgname" "$pkgdir/usr/lib/firefox/browser/extensions/firefox_extension_unity_launcher_api_e10s@kotelnik.xpi"
    install -Dm755 "$_gitpkgname-$pkgver/app-side/launcher_api_firefox_stdin.py" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/launcher_api_firefox_stdin.py"
    install -Dm644 "$_gitpkgname-$pkgver/app-side/launcher_api_firefox_stdin.py.json" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/launcher_api_firefox_stdin.py.json"
}
