# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=sanjuuni-git
pkgver=0.2~43+7a7a3af
pkgrel=1
epoch=
pkgdesc="Converts images and videos into a format that can be displayed in ComputerCraft."
arch=('x86_64' 'i386' 'armv7l' 'armv7h' 'aarch64' 'powerpc' 'ppc64el' 's390x' 'riscv64' 'riscv32')
url="https://github.com/MCJack123/sanjuuni"
license=('GPL')
groups=()
depends=('ffmpeg' 'poco' 'zlib')
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
source=("sanjuuni::git+https://github.com/MCJack123/sanjuuni.git")
noextract=()
sha256sums=(SKIP)
validpgpkeys=()

prepare() {
	true
}

pkgver() {
    cd "sanjuuni"
    echo "$(curl -sL https://api.github.com/repos/MCJack123/sanjuuni/releases/latest | grep tag_name | grep -o '[0-9][^"]*')~$(git rev-list --count HEAD)+$(git rev-parse --short HEAD)"
}

build() {
	cd "sanjuuni"
	./configure --prefix=/usr
	make
}

check() {
	true
}

package() {
	cd "sanjuuni"
	install -D -m 0755 sanjuuni "$pkgdir/usr/bin/sanjuuni"
}
