# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=fontship
pkgver=0.0.3
pkgrel=1
pkgdesc='A font development toolkit and collaborative work flow'
arch=('any')
url="https://github.com/theleagueof/$pkgname"
license=('AGPL3')
depends=('entr'
         'font-v'
         'git'
         'libarchive'
         'make'
         'python'
         'python-click'
         'python-fontmake'
         'python-fonttools'
         'python-ufonormalizer'
         'zsh')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a38aa2e5014b0320f870ad2097ef14c4245e2fd7fb251f30aa875d1f8c3f1ab6')

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
