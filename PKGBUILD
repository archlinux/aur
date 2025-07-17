# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=legacyfox
_pkgname=LegacyFox-mirror-of-git.gir.st
pkgver=4.0
pkgrel=2
pkgdesc="Legacy bootstrapped extensions for Firefox 65 and beyond"
arch=('any')
url="https://gir.st/blog/legacyfox.htm"
license=('MPL-2.0')
depends=('firefox')
_commit=312a791
source=("$_pkgname-$pkgver.tar.gz::https://github.com/girst/LegacyFox-mirror-of-git.gir.st/archive/v$pkgver.tar.gz")
sha256sums=('4480a7396e5729e8c304daaa2e0e2426c884f8416250f55640219923802d1fbd')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/lib/firefox" config.js legacy.manifest
  install -Dm644 defaults/pref/config-prefs.js "$pkgdir/usr/lib/firefox/defaults/pref/config-prefs.js"
  install -Dm644 legacy/BootstrapLoader.sys.mjs "$pkgdir/usr/lib/firefox/legacy/BootstrapLoader.sys.mjs"
  install -Dm644 legacy/RDFDataSource.sys.mjs "$pkgdir/usr/lib/firefox/legacy/RDFDataSource.sys.mjs"
  install -Dm644 legacy/RDFManifestConverter.sys.mjs "$pkgdir/usr/lib/firefox/legacy/RDFManifestConverter.sys.mjs"
}
