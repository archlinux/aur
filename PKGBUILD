# Maintainer: FACT-Finder <ff-dev@omikron.net>

pkgname=snage-bin
pkgver=0.5.5
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
sha256sums=('4f054565c2f42a278ea80b411e10bc4c3152f130810c1dc0cc55fe6534cbea6b')
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
