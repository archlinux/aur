# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=fontship
pkgver=0.0.4
pkgrel=2
pkgdesc='A font development toolkit and collaborative work flow'
arch=('any')
url="https://github.com/theleagueof/$pkgname"
license=('AGPL3')
depends=('entr'
         'font-v'
         'gftools'
         'git'
         'libarchive'
         'make'
         'python'
         'python-brotli' # fonttools optdepends
         'python-click'
         'python-fontmake'
         'python-fonttools'
         'python-fs' # fonttools optdepends
         'python-lxml' # fonttools optdepends
         'python-ufonormalizer'
         'python-unicodedata2' # fonttools optdepends
         'python-zopfli' # fonttools optdepends
         'sfnt2woff-zopfli'
         'ttfautohint'
         'woff2'
         'zsh')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b2e0ca5bb818afa5d4df075066f6f950b7e13df3ec50244ee97e91916a885b6e')

prepare() {
    cd "$pkgname-$pkgver"
    ./bootstrap.sh
}

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix="/usr"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
