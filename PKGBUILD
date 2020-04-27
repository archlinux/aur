# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
# Contributor: Daniel Ratcliffe <dratcliffe@gmail.com>
# Contributor: Jonathan Coates <contact@squiddev.cc>
pkgname=craftos-pc-data
pkgver=2.3
pkgrel=3
epoch=
pkgdesc="ROM package for CraftOS-PC"
arch=('any')
url="https://github.com/MCJack123/craftos2-rom"
license=('CCPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/MCJack123/craftos2-rom/archive/v${pkgver}.tar.gz", "expect-fix.diff::https://github.com/MCJack123/craftos2-rom/commit/67b32a9bd16524c607bbbc61ea07bdfac2ed7353.diff")
noextract=()
sha256sums=('bec66b4d952b0656118785b95049570c7eb044b5735d6345364d450d32cecc91', '3530ad46b882599ef1730a5435132b3a2b438ca0347e8771395f4ab004d04d90')
validpgpkeys=()

prepare() {
    cd "craftos2-rom-$pkgver"
    patch -p1 < ../expect-fix.diff
    cd ..
}

build() {
	true
}

check() {
    true
}

package() {
    mkdir -p "$pkgdir/usr/share/craftos"
	cp -R craftos2-rom-$pkgver/* "$pkgdir/usr/share/craftos/"
}
