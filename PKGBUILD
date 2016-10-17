#Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=nfft
pkgver=3.3.2
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
md5sums=('13e48b923501ed6feb5130c3be115fc8')

build() {
	cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
