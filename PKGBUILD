# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
# Contributor: Daniel Ratcliffe <dratcliffe@gmail.com>
# Contributor: Jonathan Coates <contact@squiddev.cc>
pkgname=craftos-pc-data-git
pkgver=2.4.3.0~147+8a5d92f
pkgrel=1
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
source=("craftos2-rom::git+https://github.com/MCJack123/craftos2-rom.git")
noextract=()
sha256sums=(SKIP)
validpgpkeys=()

prepare() {
    true
}

pkgver() {
    cd "craftos2-rom"
    echo "$(head -n 1 < rom/help/changelog.txt | grep -Po '## v\K[^ ]+').0~$(git rev-list --count HEAD)+$(git rev-parse --short HEAD)"
}

build() {
	true
}

check() {
    true
}

package() {
    mkdir -p "$pkgdir/usr/local/share/craftos"
	cp -R craftos2-rom/* "$pkgdir/usr/local/share/craftos/"
}
