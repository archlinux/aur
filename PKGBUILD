# Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=nfft
pkgver=3.3.1
pkgrel=1
pkgdesc="Library for computing Non-uniform Fast Fourier Transforms."
arch=(i686 x86_64)
url="https://www-user.tu-chemnitz.de/~potts/nfft/"
license=('GPL2')
depends=('fftw')
optdepends=('openmp: for OpenMP support')
provides=($pkgname=$pkgver)
source=("https://www-user.tu-chemnitz.de/~potts/nfft/download/$pkgname-$pkgver.tar.gz")
md5sums=('8c0516e3252ff39a245e62f1a59d0165')

build() {
	cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
