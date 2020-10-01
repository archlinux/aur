# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=legacyfox
pkgver=2.2
pkgrel=1
pkgdesc="Legacy bootstrapped extensions for Firefox 65 and beyond"
arch=('any')
url="https://gir.st/blog/legacyfox.htm"
license=('MPL')
depends=('firefox')
_commit=022cf6d
source=("https://git.gir.st/LegacyFox.git/snapshot/v$pkgver.tar.gz")
sha256sums=('19306101a5d0a973e2b0913250678dadc932432db70c56eaa443748e23825d58')

package() {
  cd "$srcdir/LegacyFox-v$pkgver-$_commit"
  install -Dm644 -t "$pkgdir/usr/lib/firefox" config.js legacy.manifest
  install -Dm644 defaults/pref/config-prefs.js "$pkgdir/usr/lib/firefox/defaults/pref/config-prefs.js"
  install -Dm644 legacy/BootstrapLoader.jsm "$pkgdir/usr/lib/firefox/legacy/BootstrapLoader.jsm"
  install -Dm644 legacy/RDFDataSource.jsm "$pkgdir/usr/lib/firefox/legacy/RDFDataSource.jsm"
  install -Dm644 legacy/RDFManifestConverter.jsm "$pkgdir/usr/lib/firefox/legacy/RDFManifestConverter.jsm"
}
