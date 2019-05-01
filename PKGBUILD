# Maintainer: Andrej Radović <r.andrej@gmail.com>

_pkgbasename=matrix-nio
pkgname=python2-matrix-nio
pkgver=0.2
pkgrel=1
pkgdesc="A Python Matrix client library, designed according to sans I/O "\
"principles"
url="https://github.com/poljar/matrix-nio"
arch=(any)
license=('custom:ISC')
depends=(
  'python2'
)
makedepends=('tar' 'gzip')
source=(
    $_pkgbasename-$pkgver.tar.gz::https://github.com/poljar/matrix-nio/archive/$pkgver.tar.gz
)
provides=('python2-matrix-nio')
conflicts=('python2-matrix-nio-git')
md5sums=('7ae5f6cd1cb9110e121732a5de3a5048')

package() {
    cd "$srcdir/${_pkgbasename}-${pkgver}"
    python2 setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 "LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
