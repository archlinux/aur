# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)

pkgname=libframe
pkgver=8.30
pkgrel=9
pkgdesc="The LIGO Scientific Consortium Algorithm Library Suite"
arch=('x86_64')
url="https://wiki.ligo.org/DASWG/LALSuiteInstall"
license=('custom')
groups=('lalsuite')
depends=('glibc')
provides=("libFrame.so")
source=("$pkgname-$pkgver.tar.gz::https://software.ligo.org/lscsoft/source/$pkgname-$pkgver.tar.gz")
sha256sums=('374743ccce835427a0900590a515c112661760e12ec596159d3f86073dd099da')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" make install
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
