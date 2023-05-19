# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

_pkgbase=intel-one-mono
pkgbase=intel-one-mono-fonts
pkgname=(otf-$_pkgbase ttf-$_pkgbase)
pkgver=1.2.0
pkgrel=1
pkgdesc="Expressive monospaced font family that’s built with clarity, legibility, and the needs of developers in mind"
url="https://github.com/intel/intel-one-mono"
arch=(any)
license=(custom:OFL)
source=(https://github.com/intel/$_pkgbase/releases/download/V$pkgver/otf.zip
        https://github.com/intel/$_pkgbase/releases/download/V$pkgver/ttf.zip
        https://raw.githubusercontent.com/intel/$_pkgbase/main/license)
sha256sums=('5675c8696efb7515ef5c1d55af4d714500cc10296dc3317f44ca868005a7bb93'
            '91acf40de3de3bc9ef295a2760986ce5fdbea6cff95e8e69b23835868c736a25'
            '1f232f7111c9c97b750652bfab9c8219285563f055275273df32ba019efc23fc')

package_otf-intel-one-mono() {
  cd otf
  install -Dt "$pkgdir"/usr/share/fonts/OTF -m644 *.otf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 ../license
}

package_ttf-intel-one-mono() {
  cd ttf
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 *.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 ../license
}
