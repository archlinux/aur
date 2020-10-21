# Maintainer: FACT-Finder <ff-dev@omikron.net>

pkgname=snage-bin
pkgver=0.5.0
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
sha256sums=('26a0c39f88d445cb0ddbf7c6d5ae7dc2ba4c22c288ec23500b93b65fbf1e4ef6')
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
