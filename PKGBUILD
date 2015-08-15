# Maintainer: Anselmo L. S. Melo <anselmo.melo@intel.com>
pkgname=soletta
pkgver=1_beta1
pkgrel=1
pkgdesc="Soletta Project is a framework for making IoT devices"
arch=('any')
url="http://github.com/solettaproject/soletta"
license=('custom:BSD3')
depends=()
makedepends=('git' 'python>=3.4' 'python-jsonschema' 'chrpath')
checkdepends=()
optdepends=('gtk3' 'icu' 'curl' 'systemd')
checkdepends=('python>3.4')
conflicts=('soletta-git')
source=("https://github.com/solettaproject/soletta/archive/v$pkgver.tar.gz")
md5sums=('b3f4fb5034c040bbf160068612bc518a')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
    make alldefconfig
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
    make -k check-fbp
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
