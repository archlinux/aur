#Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=nfft
pkgver=3.5.0
pkgrel=1
pkgdesc="Library for computing Non-uniform Fast Fourier Transforms."
arch=(i686 x86_64)
url="https://www-user.tu-chemnitz.de/~potts/nfft/"
license=('GPL2')
depends=('fftw')
optdepends=('openmp: for OpenMP support')
provides=($pkgname=$pkgver)
conflicts=('nfft-git')
source=("https://github.com/NFFT/nfft/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('5f78a9d2a675aee7ace55c96bdf1b54f049e05a1dd50697757bdc609a8586a07')

build() {
	cd "$pkgname-$pkgver"
    ./configure --prefix=/usr --enable-all --enable-openmp
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
