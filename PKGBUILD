pkgname='pacundo'
pkgver='1.0.1'
pkgrel=1
pkgdesc='A time machine to return your ArchLinux machine back to a working state.'
arch=('any')
url='https://code.ortegas.org/nortega/pacundo'
license=('Zlib')
depends=('perl' 'perl-file-readbackwards')
makedepends=('perl-par-packer' 'make')
source=("https://code.ortegas.org/nortega/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0d393a32769fa9d4f268ad33b02c05e322d53a22355b88b60134b7d54857a67d')

build() {
	cd "$pkgname"
    make pacundo
    make pacundo.1.gz
}

package() {
	cd "$pkgname"
    PREFIX="$pkgdir/usr" make install
}
