# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=legacyfox
pkgver=4.0
pkgrel=1
pkgdesc="Legacy bootstrapped extensions for Firefox 65 and beyond"
arch=('any')
url="https://gir.st/blog/legacyfox.htm"
license=('MPL-2.0')
depends=('firefox')
_commit=8841335
source=("https://git.gir.st/LegacyFox.git/snapshot/v$pkgver.tar.gz")
sha256sums=('60d908c62b6da7acd5b44056afe30951c6623a110ff952d87e9a91a26e745421')

package() {
  cd "$srcdir/LegacyFox-v$pkgver-$_commit"
  install -Dm644 -t "$pkgdir/usr/lib/firefox" config.js legacy.manifest
  install -Dm644 defaults/pref/config-prefs.js "$pkgdir/usr/lib/firefox/defaults/pref/config-prefs.js"
  install -Dm644 legacy/BootstrapLoader.sys.mjs "$pkgdir/usr/lib/firefox/legacy/BootstrapLoader.sys.mjs"
  install -Dm644 legacy/RDFDataSource.sys.mjs "$pkgdir/usr/lib/firefox/legacy/RDFDataSource.sys.mjs"
  install -Dm644 legacy/RDFManifestConverter.sys.mjs "$pkgdir/usr/lib/firefox/legacy/RDFManifestConverter.sys.mjs"
}
