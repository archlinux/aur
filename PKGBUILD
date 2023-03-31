# Maintainer: carterprince <carteraprince@gmail.com>

pkgname=libby-git
pkgver=r30.f253e26
pkgrel=1
pkgdesc="a simple cli tool to download books from Library Genesis"
arch=(any)
url=https://github.com/carterprince/libby
license=(GPL3)
depends=(python-requests python-tqdm python-beautifulsoup4)
optdepends=('neomutt' 'rofi' 'calibre')
makedepends=(git)
provides=(libby)
conflicts=(libby)
source=($pkgname::git+https://github.com/carterprince/libby)
md5sums=(SKIP)

pkgver() {
    cd "$srcdir"/$pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir"/$pkgname
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
