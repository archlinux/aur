#Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=nfft
pkgver=3.5.2
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
sha256sums=('cf3b2f3b2eabd79e49a5fbabf7f8d73fc3c57c4f68ae71e29f6dead853ab2901')

build() {
	cd "$pkgname-$pkgver"
    ./configure --prefix=/usr --enable-all --enable-openmp
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
