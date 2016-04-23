# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=programmers-turkish-f
pkgver=0.0.1
pkgrel=1
pkgdesc="Variant of the Turkish-F layout with symbols and usage adapted from Programmer Dvorak"
arch=(any)
url="https://github.com/alerque/programmers-turkish-f"
license=('custom')
depends=('kbd' 'libxslt')
makedepends=('coreutils' 'programmers-dvorak')
source=("https://github.com/alerque/${pkgname}/archive/${pkgver}.tar.gz"
        "LICENSE")
sha256sums=('0a54614e1340ed92d4c6d2bd86cd4213a8c3bd39f1eabb9502d5fe53cef5e4b1'
            '123675c594fe0349a7c27b124cf03715d293af60047d1916c657ac25d0f86ce8')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/linux"
  XKB_ROOT="${pkgdir}/usr/share/X11/xkb/symbols"
  install -Dm644 ptf.xkb $XKB_ROOT/ptf
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

