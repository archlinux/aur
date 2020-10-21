# Maintainer: FACT-Finder <ff-dev@omikron.net>

pkgname=snage-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="A tool for managing change logs."
arch=(any)
url="https://github.com/FACT-Finder/snage"
license=('MIT')
depends=('nodejs')
optdepends=('git: git-version provider')
provides=('snage')
conflicts=('snage')

source=("snage-$pkgver.tar.gz::https://github.com/FACT-Finder/snage/releases/download/v$pkgver/snage-$pkgver.tar.gz")
sha256sums=('dfbeed8903e20f119666099db55ec4fae681f62fd266be11f31ab2ac3b8405ba')
options=(!strip)

package() {
  install -d "$pkgdir/usr/lib/snage"
  cd "$pkgdir/usr/lib/snage"
  cp -a "$srcdir/snage-$pkgver/." .

  chmod +x "snage.js"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/snage/snage.js" "$pkgdir/usr/bin/snage"
  install -Dm644 -t "$pkgdir/usr/share/licenses/snage-bin" "$srcdir/snage-$pkgver/LICENSE"
}
