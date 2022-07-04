# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=legacyfox
pkgver=3.0
pkgrel=1
pkgdesc="Legacy bootstrapped extensions for Firefox 65 and beyond"
arch=('any')
url="https://gir.st/blog/legacyfox.htm"
license=('MPL')
depends=('firefox')
_commit=0548b59
source=("https://git.gir.st/LegacyFox.git/snapshot/v$pkgver.tar.gz")
sha256sums=('f2d1e28ce393192391ba68c030edd580a5c1eff781b0f1281ce32d6f54ba3c6e')

package() {
  cd "$srcdir/LegacyFox-v$pkgver-$_commit"
  install -Dm644 -t "$pkgdir/usr/lib/firefox" config.js legacy.manifest
  install -Dm644 defaults/pref/config-prefs.js "$pkgdir/usr/lib/firefox/defaults/pref/config-prefs.js"
  install -Dm644 legacy/BootstrapLoader.jsm "$pkgdir/usr/lib/firefox/legacy/BootstrapLoader.jsm"
  install -Dm644 legacy/RDFDataSource.jsm "$pkgdir/usr/lib/firefox/legacy/RDFDataSource.jsm"
  install -Dm644 legacy/RDFManifestConverter.jsm "$pkgdir/usr/lib/firefox/legacy/RDFManifestConverter.jsm"
}
