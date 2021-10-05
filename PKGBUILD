# Maintainer: Nova Wittam <novawittam@gmail.com>
pkgname=nbtvol
pkgver=1.0.2
pkgrel=1
epoch=
pkgdesc="A simple set of shell scripts and C programs to control bluetooth device volume through PulseAudio"
arch=("x86_64")
url="https://github.com/Not-Super-Nova/nbtvol"
license=('GPL3')
groups=()
depends=("systemd>=248.3-3" "dbus>=1.12.20-1" "sed>=4.8-1" "grep>=3.6-1" "coreutils>=8.32-1" "libpulse>=14.2-3" "bash>=5.1.008-3")
makedepends=("gcc>=11.1.0-1" "gcc-libs>=11.1.0-1")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz")
noextract=()
sha512sums=("b8183adc4d0ab5eb5c231dc503e18758e5a03c0582b30c1e14c8f06257532c417686669c89ca5e79608971a7fe0137c7dedfccfd3b43f3885e07d744415ee93b")
validpgpkeys=()

build() {
	gcc main.c -o ./volwatcher
}

package() {
	mkdir -p ~/.local/bin
	cp ./volwatcher ./btVolume ./btVolumeWrapper ~/.local/bin/
}
