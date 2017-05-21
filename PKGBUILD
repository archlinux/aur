# Maintainer: Martin Kostolný <clearmartin at zoho dot com>

pkgname=firefox-extension-unity-launcher-api-e10s
_gitpkgname=firefox-extension-unity-launcher-api-e10s
pkgver=1.1.3
_xpipkgname="unity_launcher_api_addon_e10s-$pkgver-linux.xpi"
pkgrel=1
pkgdesc="Unity Launcher API add-on, compatible with e10s."
url="https://github.com/kotelnik/$_gitpkgname"
arch=('any')
license=('GPL3')
depends=('firefox' 'python3')
makedepends=('git')
source=(
    "https://addons.mozilla.org/firefox/downloads/file/639891/$_xpipkgname"
    "https://github.com/kotelnik/$_gitpkgname/archive/v$pkgver.tar.gz")
noextract=("$_xpipkgname")
sha512sums=(
    'ee14db7c73c2ba23cbdd89201bb5d229ed130d42dfc953521f6dbf61adb2c3d8dd8a3cbebf5e547d54378d16a70c554b2451c00351c5f5d6fd78699d2af5cf8a'
    'f28dc36aece7e9f24dd6e769088733a789f63a9b7869934758a665ffb525ada7b032336d1f0f350cccaab6b0835c2e87c13b2fe9ce343bb8800f330e7a2c8802')

package() {
    install -Dm644 "$_xpipkgname" "$pkgdir/usr/lib/firefox/browser/extensions/firefox_extension_unity_launcher_api_e10s@kotelnik.xpi"
    install -Dm755 "$_gitpkgname-$pkgver/app-side/launcher_api_firefox_stdin.py" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/launcher_api_firefox_stdin.py"
    install -Dm644 "$_gitpkgname-$pkgver/app-side/launcher_api_firefox_stdin.py.json" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/launcher_api_firefox_stdin.py.json"
}
