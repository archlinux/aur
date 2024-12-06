# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

pkgname=kissfft-git
pkgver=376.f5f2a3b
pkgrel=1
pkgdesc='A Fast Fourier Transform (FFT) library that tries to Keep it Simple, Stupid'
arch=('any')
url='https://github.com/mborgerding/kissfft'
license=('BSD-3-Clause') # TODO fix SPDX
depends=()
makedepends=('git')
conflicts=('kissfft')
provides=('kissfft')
source=('git+https://github.com/mborgerding/kissfft.git')
sha256sums=('SKIP')

pkgver() {
	cd kissfft
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd kissfft
	install -dm755 "${pkgdir}/usr/include/kissfft/"
	install -m644 kiss_fft.h "${pkgdir}/usr/include/kissfft/kiss_fft.h"
	install -Dm644 LICENSES/BSD-3-Clause "${pkgdir}/usr/share/licenses/kissfft-git/LICENSE"
}
