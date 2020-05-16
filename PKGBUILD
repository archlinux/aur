pkgname=mingw-w64-fftw-bin
pkgver=3.3.8
pkgrel=1
pkgdesc="A library for computing the discrete Fourier transform (DFT) (mingw-w64)"
arch=('any')
url="http://www.fftw.org"
license=("GPL")
depends=('mingw-w64-crt')
provides=('mingw-w64-fftw')
source=("fftw-bin.tar.gz")
sha256sums=('SKIP')

_architectures="x86_64-w64-mingw32"

build() {
  cd "${srcdir}"

  tar xvf fftw-bin.tar.gz
}

package() {
  cd "${srcdir}/fftw-bin"
  for _arch in ${_architectures}; do
	  mkdir -p "$pkgdir"/usr/${_arch}/include
	  mkdir -p "$pkgdir"/usr/${_arch}/lib/pkgconfig
	  cp include/* "$pkgdir"/usr/${_arch}/include/
	  cp -r lib/* "$pkgdir"/usr/${_arch}/lib
  done
}


