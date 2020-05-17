pkgname=mingw-w64-fftw-bin
pkgver=3.3.8
pkgrel=1
pkgdesc="A library for computing the discrete Fourier transform (DFT) (mingw-w64)"
arch=('any')
url="http://www.fftw.org"
license=("GPL")
depends=('mingw-w64-crt')
provides=('mingw-w64-fftw')
source=("http://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-fftw-3.3.8-2-any.pkg.tar.zst")
sha256sums=('SKIP')

_architectures="x86_64-w64-mingw32"

package() {
  cd "${srcdir}/mingw64"
  for _arch in ${_architectures}; do
    mkdir -p ./* $pkgdir/usr/${_arch}/
    sed -i -e "s|/mingw64|/usr/${_arch}|" ./lib/pkgconfig/*
    cp -r ./* $pkgdir/usr/${_arch}/
  done
}


