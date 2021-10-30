# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=font-downloader
_commit=c61f95fdc77fe6a6337310304ed4686cbf5203d3
pkgver=9.0.0
pkgrel=1
pkgdesc='Install fonts from online sources'
arch=(any)
url=https://github.com/GustavoPeredo/Font-Downloader
license=(GPL3)
depends=('libhandy>=0.90.0')
makedepends=(meson git)
checkdepends=(appstream-glib)
source=("$pkgname::git+$url#commit=$_commit")
md5sums=(SKIP)

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

check() {
	:
	# TODO: Add once validation type is changed
	#meson test -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
