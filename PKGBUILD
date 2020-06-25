# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=fontship
pkgver=0.1.1
pkgrel=1
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
         'python-cffsubr' # ufo2ft optdepends
         'python-fontmake'
         'python-fonttools'
         'python-fs' # fonttools optdepends
         'python-lxml' # fonttools optdepends
         'python-skia-pathops' # ufo2ft optdepends
         'python-ufo2ft'
         'python-ufonormalizer'
         'python-unicodedata2' # fonttools optdepends
         'python-zopfli' # fonttools optdepends
         'sfnt2woff-zopfli'
         'ttfautohint'
         'woff2'
         'zsh')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('697701e104b6c3d133c11f42a23d2d9214c2cbfcfed683455cfb8db4aeead2ab')

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
