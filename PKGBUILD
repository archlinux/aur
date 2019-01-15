# Maintainer: Mutantoe <mutantoe+aur@mailbox.org>
pkgname=marblemarcher
pkgver=20190112
pkgrel=2
pkgdesc="A Fractal Physics Game"
arch=(x86_64)
url="https://github.com/HackerPoet/MarbleMarcher"
license=('GPL2')
groups=()
depends=("sfml")
makedepends=("cmake" "eigen")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/HackerPoet/MarbleMarcher.git" 
        "marblemarcher.sh")
noextract=()
sha256sums=('SKIP'
            'cee179b15d5c3e16e1a78fa6309ddea9a1224de662365aa2f28d6583a250d29e')

build() {
  cd "$pkgname"
  mkdir -p build && cd build
  cmake ..
  cd ..
  cmake --build build
}

package() {
  install -Dm755 marblemarcher.sh "$pkgdir/usr/bin/marblemarcher"
  mkdir -p "$pkgdir/usr/share/$pkgname"

  cd "$pkgname"
  
  install -Dm755 build/MarbleMarcher "$pkgdir/usr/share/$pkgname"
  cp -r assets "$pkgdir/usr/share/$pkgname"
}
