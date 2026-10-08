# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream tags no clean version, so pkgver is the pinned commit's date and
# _tag carries the commit itself. The bundled htslib subset is vendored in the
# repository, so no external htslib is needed.

pkgname=htsbox
_tag=c901cb3a3324c119988f4bcd4412cbe48e1b5a38
pkgver=20250911
pkgrel=1
pkgdesc="Powerful toolset for processing BAM files and a test bed for htslib"
arch=('x86_64')
url="https://github.com/lh3/htsbox"
license=('MIT')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${_tag}.tar.gz")
sha256sums=('085aecc9ad28434aaa7cc61f09b17c93a0ea5c643a688ddbbc1b9ed24c2850d9')

build() {
    cd "$srcdir/$pkgname-$_tag"
    make
}

package() {
    cd "$srcdir/$pkgname-$_tag"
    install -Dm755 htsbox "$pkgdir/usr/bin/htsbox"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
