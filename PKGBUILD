# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>
# Contributor: Ghabry <gabriel-aur mastergk de>

pkgname=minimap2
pkgver=2.30
pkgrel=1
pkgdesc="A versatile pairwise aligner for genomic and spliced nucleotide sequences"
arch=("x86_64")
url="https://lh3.github.io/minimap2"
license=("MIT")
depends=('zlib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lh3/minimap2/archive/v${pkgver}.tar.gz")
sha256sums=('4e5cd621be2b2685c5c88d9b9b169c7e036ab9fff2f3afe1a1d4091ae3176380')

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
