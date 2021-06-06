pkgname='adscript'
pkgdesc="A high-performance, s-expressions based programming language that is natively compiled."
pkgver=0.6
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
md5sums=('d1a1d4a440f235873e2351b68b1ee53b')
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



