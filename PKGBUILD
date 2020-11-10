# Maintainer: HaoCheng <ch1994@outlook.com>
pkgname=getit
pkgver=4.0.10
pkgrel=2
pkgdesc="Application to send HTTP requests to test your API endpoints."
arch=('any')
url="https://github.com/bartkessels/GetIt"
license=('GPL')
groups=()
depends=('webkit2gtk' 'gtksourceview3')
makedepends=('git' 'meson') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+https://github.com/bartkessels/GetIt.git#tag=${pkgver}")
noextract=()
md5sums=('SKIP')

build() {
	cd "$srcdir/${pkgname}"
	meson --prefix=/usr build
	meson compile -C build
}

package() {
	cd "$srcdir/${pkgname}"
	DESTDIR="$pkgdir" meson install -C build

}
