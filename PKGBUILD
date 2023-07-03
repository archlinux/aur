# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=legacyfox
pkgver=3.1
pkgrel=1
pkgdesc="Legacy bootstrapped extensions for Firefox 65 and beyond"
arch=('any')
url="https://gir.st/blog/legacyfox.htm"
license=('MPL')
depends=('firefox')
_commit=79ef33e
source=("https://git.gir.st/LegacyFox.git/snapshot/v$pkgver.tar.gz")
sha256sums=('7ce29240907fc3b55fbadd1665f9705e5e558302ba81e9d4f42ec7c3dfbff38d')

package() {
  cd "$srcdir/LegacyFox-v$pkgver-$_commit"
  install -Dm644 -t "$pkgdir/usr/lib/firefox" config.js legacy.manifest
  install -Dm644 defaults/pref/config-prefs.js "$pkgdir/usr/lib/firefox/defaults/pref/config-prefs.js"
  install -Dm644 legacy/BootstrapLoader.jsm "$pkgdir/usr/lib/firefox/legacy/BootstrapLoader.jsm"
  install -Dm644 legacy/RDFDataSource.jsm "$pkgdir/usr/lib/firefox/legacy/RDFDataSource.jsm"
  install -Dm644 legacy/RDFManifestConverter.jsm "$pkgdir/usr/lib/firefox/legacy/RDFManifestConverter.jsm"
}
