# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=programmers-turkish-f
pkgver=0.0.2
pkgrel=1
pkgdesc='Variant of the Turkish-F layout with symbols and usage adapted from Programmer Dvorak'
arch=(any)
url='https://github.com/alerque/programmers-turkish-f'
license=(BSD-3-Clause)
depends=(kbd libxslt)
makedepends=(coreutils)
source=("https://github.com/alerque/$pkgname/archive/$pkgver.tar.gz"
        'LICENSE')
sha256sums=('0c3144063d62c3e7a5c4e28d0cefa508519a25e29fd476d90ad1ea6c1648eb11'
            '123675c594fe0349a7c27b124cf03715d293af60047d1916c657ac25d0f86ce8')

package() {
  cd "$pkgname-$pkgver/linux"
  XKB_ROOT="$pkgdir/usr/share/X11/xkb/symbols"
  install -Dm644 ptf.xkb "$XKB_ROOT/ptf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

