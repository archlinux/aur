pkgname='adscript'
pkgdesc="A high-performance, s-expressions based programming language that is natively compiled."
pkgver=0.5
pkgrel=1
ghorg='Amplus2'
ghrepo='Adscript'
url="https://github.com/${ghorg}/${ghrepo}"
license=('MPL2')
options=(!buildflags)
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
depends=('llvm>=11.1')
makedepends=('clang>=11.1')
source=("${url}/archive/refs/tags/${pkgname}-${pkgver}.tar.gz")
md5sums=('9e5aa6397a64a02b8471e5aee6d7ab96')
install=$pkgname.install

upname='Adscript'

build() {
  cd "$upname-$pkgname-$pkgver"
  make
}

package() {
  cd "$upname-$pkgname-$pkgver"
  sudo make install PREFIX=/usr
}



