# Maintainer: j-james <jj@j-james.me>
pkgname=soundfont-ensembles
_pkgname=ensemblesgmsoundfont
pkgver=0.0.3
pkgrel=1
pkgdesc="Soundfonts for Ensembles"
arch=('any')
url='https://gitlab.com/SubhadeepJasu/ensemblesgmsoundfont'
groups=('soundfonts')
makedepends=('git' 'meson' 'ninja')
source=("$_pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz")
sha256sums=('0b5ecca24623dabc9ea546c49cc25ebb3f419d6b61c035c603133a1032a4f2bc')

build() {
	cd "$_pkgname-v$pkgver"

	meson build --prefix=/usr
	ninja -C build
}

package() {
	cd "$_pkgname-v$pkgver"

	DESTDIR="$pkgdir/" ninja -C build install
}
