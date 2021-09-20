# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=btop
pkgver=1.0.2
pkgrel=1
pkgdesc='A monitor of system resourecs, bpytop ported to C++'
arch=(x86_64)
url="https://github.com/aristocratos/$pkgname"
license=(apache)
depends=(gcc-libs)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('82da1805ed5e9d7d58b64f4140577ba978d73072cf58cbadc0931ea31455a0ab')

build() {
	cd "$_archive"
	make all
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
