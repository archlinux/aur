# Maintainer: FACT-Finder <ff-dev@fact-finder.com>

pkgname=snage-bin
pkgver=0.5.13
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
sha256sums=('24fcb7badf630be5b65d7ab8d173c211f6f2031f2e7ac2a97b72cb91363a42f0')
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
