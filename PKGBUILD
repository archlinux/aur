pkgname=('shengbte')
pkgver=1.1.1
pkgrel=1
pkgdesc="ShengBTE is a software package for solving the Boltzmann Transport Equation for phonons"
arch=('any')
url="http://www.shengbte.org/"
license=('GPL')
depends=("lapack" "spglib" "openmpi")
makedepends=("gcc-fortran")
source=("http://www.shengbte.org/downloads/ShengBTE-v$pkgver-8a63749.tar.bz2" "arch.make")
sha1sums=("30089b08da8de198c6c42b3cd15f5ffc6fe4aacb" "1eff68ef51c28a9c6d110dd7fd5447313495d6f3")

build() {
	cp ../arch.make "$srcdir"/ShengBTE/Src/
	cd "$srcdir"/ShengBTE/Src/
	make
}

package() {
  cd "$srcdir"/ShengBTE
  install -Dm755 ShengBTE "$pkgdir"/usr/bin/ShengBTE
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
