# Maintainer: Ilya Fedin <ilya-fedin@outlook.com>

pkgname=rlottie-tdesktop
_pkgname=rlottie
pkgver=0.0.1
pkgrel=1
pkgdesc="A platform independent standalone library that plays Lottie Animation (tdesktop fork)"
arch=(x86_64)
url="https://github.com/desktop-app/rlottie"
license=(LGPL2.1)
depends=(gcc-libs)
makedepends=(meson)
conflicts=(rlottie)
provides=(rlottie)
_commit="c490c7a098b9b3cbc3195b00e90d6fc3989e2ba2"
source=("https://github.com/desktop-app/rlottie/archive/${_commit}.zip")
sha512sums=('7da1a9bb6b02de85cba24bba58d81fb0f8c54eeace24454ac7337c8be63a9314a7996adbd841213c8c67162984253544fcc87059bcf0277c2a911cf182747aae')

build() {
	cd "$srcdir/${_pkgname}-${_commit}"
	arch-meson build
	ninja -C build
}

package() {
	cd "$srcdir/${_pkgname}-${_commit}"
	DESTDIR="$pkgdir" meson install -C build
}
