# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=legacyfox
pkgver=5.1
pkgrel=1
pkgdesc="Legacy bootstrapped extensions for Firefox 65 and beyond"
arch=('any')
url="https://gir.st/blog/legacyfox.htm"
license=('MPL-2.0')
depends=('firefox')
_commit=4013123
source=("LegacyFox-v$pkgver-$_commit.tar.gz::https://git.gir.st/LegacyFox.git/snapshot/v$pkgver.tar.gz")
sha256sums=('e688e7087166cd90b056eb1b0042d8ed1b99b4fbc8b0a1fb7e0552dd2b72d5da')

package() {
  cd "$srcdir/LegacyFox-v$pkgver-$_commit"
  install -Dm644 -t "$pkgdir/usr/lib/firefox" config.js legacy.manifest
  install -Dm644 defaults/pref/config-prefs.js "$pkgdir/usr/lib/firefox/defaults/pref/config-prefs.js"
  install -Dm644 legacy/BootstrapLoader.sys.mjs "$pkgdir/usr/lib/firefox/legacy/BootstrapLoader.sys.mjs"
  install -Dm644 legacy/LegacyFoxUtils.sys.mjs "$pkgdir/usr/lib/firefox/legacy/LegacyFoxUtils.sys.mjs"
  install -Dm644 legacy/RDFDataSource.sys.mjs "$pkgdir/usr/lib/firefox/legacy/RDFDataSource.sys.mjs"
  install -Dm644 legacy/RDFManifestConverter.sys.mjs "$pkgdir/usr/lib/firefox/legacy/RDFManifestConverter.sys.mjs"
}
