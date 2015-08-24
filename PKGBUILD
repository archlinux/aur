# Maintainer: Anselmo L. S. Melo <anselmo.melo@intel.com>
pkgname=soletta
pkgver=1_beta2
pkgrel=1
pkgdesc="Soletta Project is a framework for making IoT devices"
arch=('any')
url="http://github.com/solettaproject/soletta"
license=('custom:BSD3')
depends=()
makedepends=('git' 'python>=3.4' 'python-jsonschema' 'chrpath')
checkdepends=()
optdepends=('gtk3' 'icu' 'curl' 'systemd')
conflicts=('soletta-git')
source=("https://github.com/solettaproject/soletta/archive/v$pkgver.tar.gz")
md5sums=('21464bf457b0907855f5773d6db9fd2a')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
    make alldefconfig
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
