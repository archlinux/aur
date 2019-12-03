# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=matrix-nio
pkgver=0.6
pkgrel=1
pkgdesc="A Python Matrix client library, designed according to sans I/O "\
"principles"
url="https://github.com/poljar/matrix-nio"
arch=(any)
license=('custom:ISC')
depends=(
  'python'
)
makedepends=('tar' 'gzip')
source=(
    $pkgname-$pkgver.tar.gz::https://github.com/poljar/matrix-nio/archive/$pkgver.tar.gz
)
provides=('matrix-nio')
conflicts=('matrix-nio-git' 'python-nio')
sha256sums=('ce1a95d52376c8e30c7c546b39d2d5d7ff5ec09408af911ed0a64452619fd4a4')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
