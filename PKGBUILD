# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=matrix-nio
pkgver=0.2
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
conflicts=('matrix-nio-git')
md5sums=('7ae5f6cd1cb9110e121732a5de3a5048')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
