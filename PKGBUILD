# Maintainer: Hash <elpoepstudios@gmail.com>
# Contributor: none

pkgname=elpaudio-mini
pkgdesc="Simple audio player, written on GameBreaker"
pkgver=0.0.1
pkgrel=1
arch=(x86_64)
url="https://codeberg.org/elpAudio/elpAudioMini"
license=(BSD-3)
depends=(gamebreaker-sdl3)
conflicts=()
makedepends=(make)
source=("elpAudioMini-${pkgver}.tar.gz::https://codeberg.org/elpAudio/elpAudioMini/archive/v${pkgver}.tar.gz")
md5sums=('ea8b0fd5959dd74222e0a825adfe74c2')

build() {
	rename "elpaudiomini" "elpAudioMini-${pkgver}" "${srcdir}/elpaudiomini"
	cd "${srcdir}/elpAudioMini-${pkgver}"
	mkdir "build"
	make
}

package(){
	cd "${srcdir}/elpAudioMini-${pkgver}"

	mkdir -p "$pkgdir/opt/elpAudioMini/"
	
	cp -drf resources/* "$pkgdir/opt/elpAudioMini/"
	cp -drf themes/* "$pkgdir/opt/elpAudioMini/"
	cp "elpAudioMini" "$pkgdir/opt/elpAudioMini/"
	echo elpAudioMini was installed to /opt/elpAudioMini
}
