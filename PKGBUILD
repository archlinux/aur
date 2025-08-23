# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=legacyfox
pkgver=5.0
pkgrel=1
pkgdesc="Legacy bootstrapped extensions for Firefox 65 and beyond"
arch=('any')
url="https://gir.st/blog/legacyfox.htm"
license=('MPL-2.0')
depends=('firefox')
_commit=836dade
source=("LegacyFox-v$pkgver-$_commit.tar.gz::https://git.gir.st/LegacyFox.git/snapshot/v$pkgver.tar.gz")
sha256sums=('bde9fe55e6ba270f2f929e52373f870a9b5e68cdbb693853e8cdf2b86f1a5eae')

package() {
  cd "$srcdir/LegacyFox-v$pkgver-$_commit"
  install -Dm644 -t "$pkgdir/usr/lib/firefox" config.js legacy.manifest
  install -Dm644 defaults/pref/config-prefs.js "$pkgdir/usr/lib/firefox/defaults/pref/config-prefs.js"
  install -Dm644 legacy/BootstrapLoader.sys.mjs "$pkgdir/usr/lib/firefox/legacy/BootstrapLoader.sys.mjs"
  install -Dm644 legacy/LegacyFoxUtils.sys.mjs "$pkgdir/usr/lib/firefox/legacy/LegacyFoxUtils.sys.mjs"
  install -Dm644 legacy/RDFDataSource.sys.mjs "$pkgdir/usr/lib/firefox/legacy/RDFDataSource.sys.mjs"
  install -Dm644 legacy/RDFManifestConverter.sys.mjs "$pkgdir/usr/lib/firefox/legacy/RDFManifestConverter.sys.mjs"
}
