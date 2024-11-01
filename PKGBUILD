# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>
# Contributor: Ghabry <gabriel-aur mastergk de>

pkgname=minimap2
pkgver=2.28
pkgrel=1
pkgdesc="A versatile pairwise aligner for genomic and spliced nucleotide sequences"
arch=("x86_64")
url="https://lh3.github.io/minimap2"
license=("MIT")
depends=('zlib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lh3/minimap2/archive/v${pkgver}.tar.gz")
sha256sums=('5ea6683b4184b5c49f6dbaef2bc5b66155e405888a0790d1b21fd3c93e474278')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # application
    install -Dm0755 $pkgname "$pkgdir/usr/bin/$pkgname"

    # license
    install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
