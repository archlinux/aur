# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream tags nothing, so pkgver is the pinned commit's date and _tag carries
# the commit itself.

pkgname=srf
_tag=e54ca8c8eccf6b1f19428b0f862f2c90575290a0
pkgver=20240108
pkgrel=1
pkgdesc="Satellite repeat finder for long DNA sequences"
arch=('x86_64')
url="https://github.com/lh3/srf"
license=('MIT')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${_tag}.tar.gz")
sha256sums=('8a9e6851ff02c119eade2b1a8f1758ba0fda4780cd8547630da204abf84ba6c4')

build() {
    cd "$srcdir/$pkgname-$_tag"
    make
}

package() {
    cd "$srcdir/$pkgname-$_tag"
    install -Dm755 srf "$pkgdir/usr/bin/srf"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
