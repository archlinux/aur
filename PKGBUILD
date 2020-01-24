# Maintainer: Ilya Fedin <ilya-fedin@outlook.com>

pkgname=rlottie-tdesktop
_pkgname=rlottie
pkgver=0.0.1
pkgrel=4
pkgdesc="A platform independent standalone library that plays Lottie Animation (tdesktop fork)"
arch=(x86_64)
url="https://github.com/desktop-app/rlottie"
license=(LGPL2.1)
depends=(gcc-libs)
makedepends=(cmake ninja)
conflicts=(rlottie)
provides=(rlottie)
_commit="75b31e49b3c69355c4971ee2029eff23a22fcb75"
source=("https://github.com/desktop-app/rlottie/archive/${_commit}.zip")
sha512sums=('2fb09273cc2b2ea4976ef047be911a796b9a1e4a11d00ebd6288ed7d1fae5e5bef15f46609ddcecb3eac973ccc063ebc44eb970147f8c3835c9cbafe2ac5508d')

build() {
	cd "$srcdir/${_pkgname}-${_commit}"
	cmake -G Ninja . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	cmake --build .
}

package() {
	cd "$srcdir/${_pkgname}-${_commit}"
	DESTDIR="$pkgdir" cmake --install .
}
