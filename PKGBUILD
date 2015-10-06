# Maintainer: Anselmo L. S. Melo <anselmo.melo@intel.com>
pkgdesc="Soletta project is a framework for making IoT devices."
arch=('i686' 'x86_64')
url="http://github.com/solettaproject/soletta"
license=('custom:BSD3')
depends=('python>=3.4' 'python-jsonschema' 'icu' 'curl' 'systemd' 'pcre')
makedepends=('git' 'python>=3.4' 'python-jsonschema')
optdepends=('gtk3')
pkgname=soletta
pkgver=1_beta6
pkgrel=1
checkdepends=()
conflicts=('soletta-git')
source=("https://github.com/solettaproject/soletta/archive/v$pkgver.tar.gz")

prepare() {
    cd "$pkgname-$pkgver"
    git submodule init && git submodule update
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
md5sums=('8ef846a1e9def168ec90d4dfaa5b2c68')
