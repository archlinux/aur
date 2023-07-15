# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=legacyfox
pkgver=3.2
pkgrel=1
pkgdesc="Legacy bootstrapped extensions for Firefox 65 and beyond"
arch=('any')
url="https://gir.st/blog/legacyfox.htm"
license=('MPL')
depends=('firefox')
_commit=fc77a6a
source=("https://git.gir.st/LegacyFox.git/snapshot/v$pkgver.tar.gz")
sha256sums=('583f854802ede50262421f1fb65f3ff624d38f04dff5f3d20f1aebc47b56ae22')

package() {
  cd "$srcdir/LegacyFox-v$pkgver-$_commit"
  install -Dm644 -t "$pkgdir/usr/lib/firefox" config.js legacy.manifest
  install -Dm644 defaults/pref/config-prefs.js "$pkgdir/usr/lib/firefox/defaults/pref/config-prefs.js"
  install -Dm644 legacy/BootstrapLoader.jsm "$pkgdir/usr/lib/firefox/legacy/BootstrapLoader.jsm"
  install -Dm644 legacy/RDFDataSource.jsm "$pkgdir/usr/lib/firefox/legacy/RDFDataSource.jsm"
  install -Dm644 legacy/RDFManifestConverter.jsm "$pkgdir/usr/lib/firefox/legacy/RDFManifestConverter.jsm"
}
