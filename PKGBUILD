_pkgname=pokesprite
pkgname=${_pkgname}-git
pkgver=r3.f7cc1d6
pkgrel=1
pkgdesc="Show a random Pokémon in your terminal"
url="https://github.com/tomKPZ/pokesprite"
arch=("x86_64")
depends=("glibc")
makedepends=("git" "python-beautifulsoup4" "python-requests" "python-matplotlib")
license=('GPL3')

source=("git+https://github.com/tomKPZ/pokesprite.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_pkgname}"
    make
}

package() {
    cd "$srcdir/${_pkgname}"
    mkdir -p "$pkgdir/usr/bin"
    cp pokesprite "$pkgdir/usr/bin"
}
