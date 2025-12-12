# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: aquanjsw <zhdlcc@gmail.com>
pkgname=silence-player
pkgver=1.0.0
pkgrel=1
epoch=0
pkgdesc="Silence audio player"
arch=(x86_64)
url=""
license=('GPL-1.0-or-later')
groups=()
depends=(alsa-lib glibc)
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
source=(main.c silence-player.service)
noextract=()
sha256sums=(871c53868186862c343a423b1d2432634c5ac11d59f88fd4baff23037e9c9ae4
            0ec3d3303a80a5c831a59521cd9ec81841f97aec4f743b4068b102e8a29fd5a9)
validpgpkeys=()

build() {
	gcc -o silence-player main.c -lasound -Wl,-z,relro -Wl,-z,now
}

package() {
	install -Dm755 silence-player "$pkgdir/usr/bin/silence-player"
	install -Dm644 silence-player.service "$pkgdir/etc/systemd/user/silence-player.service"
}
