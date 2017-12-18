#Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=nfft
pkgver=3.4.0
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
md5sums=('f2e0f7848fe84347ad8a4f01dc9ce297')

build() {
	cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
