# Maintainer: Martin Kostolný <clearmartin at zoho dot com>

pkgname=firefox-extension-unity-launcher-api-e10s
_gitpkgname=firefox-extension-unity-launcher-api-e10s
pkgver=1.1.2
_xpipkgname="unity_launcher_api_addon_e10s-$pkgver-linux.xpi"
pkgrel=1
pkgdesc="Unity Launcher API add-on, compatible with e10s."
url="https://github.com/kotelnik/$_gitpkgname"
arch=('any')
license=('GPL3')
depends=('firefox' 'python3')
makedepends=('git')
source=(
    "https://addons.mozilla.org/firefox/downloads/file/560557/$_xpipkgname"
    "https://github.com/kotelnik/$_gitpkgname/archive/v$pkgver.tar.gz")
noextract=("$_xpipkgname")
sha512sums=(
    '60e6d1e03be9308d267f7529036b6ba5965ad8650fa9e2be639a7edb55066726c1bc5430b27d7aaf5962a8ca2bf2eeb8dc4e574894224ed321e58c7221ffad4a'
    'bed52099de5fd16c29aea68f778779baf972cf54d13a502714e8132cef4f407f96756f219c1871e6f8eb60a99d43f817ec639bf0538f7c2cd36b0018d2700371')

package() {
    install -Dm644 "$_xpipkgname" "$pkgdir/usr/lib/firefox/browser/extensions/firefox_extension_unity_launcher_api_e10s@kotelnik.xpi"
    install -Dm755 "$_gitpkgname-$pkgver/app-side/launcher_api_firefox_stdin.py" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/launcher_api_firefox_stdin.py"
    install -Dm644 "$_gitpkgname-$pkgver/app-side/launcher_api_firefox_stdin.py.json" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/launcher_api_firefox_stdin.py.json"
}
