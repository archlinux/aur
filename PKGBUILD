# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream tags nothing, so pkgver is the pinned commit's date and _tag carries
# the commit itself (the CLI is still marked unstable upstream).

pkgname=bedtk
_tag=fa2cc15a8ab61d28bf6a4cfd50f36f883021a385
pkgver=20250824
pkgrel=1
pkgdesc="Simple toolkit for processing BED files"
arch=('x86_64')
url="https://github.com/lh3/bedtk"
license=('MIT')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${_tag}.tar.gz")
sha256sums=('77b66e5ed963c74aea081f760396c317de9345274f97f905f323e73dee24e6f6')

build() {
    cd "$srcdir/$pkgname-$_tag"
    make
}

package() {
    cd "$srcdir/$pkgname-$_tag"
    install -Dm755 bedtk "$pkgdir/usr/bin/bedtk"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
