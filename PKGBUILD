#Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=nfft
pkgver=3.5.1
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
sha256sums=('bb95b2c240c6d972d4bb20740751a8efeba8b48b3be1d61fd59883909776fee3')

build() {
	cd "$pkgname-$pkgver"
    ./configure --prefix=/usr --enable-all --enable-openmp
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
