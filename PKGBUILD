# Maintainer: Chandler Klüser <chandler.kluser@gmail.com>

pkgname=amiberry
pkgver=4bd019c45042186775405973474ba6db6b94f68f
pkgrel=1
epoch=20230613
pkgdesc="Amiga Emulator for ARM Boards (amd64 build)"
arch=('x86_64')
url="https://github.com/BlitterStudio/amiberry"
license=('unknown')
depends=('flac' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'mpg123' 'libmpeg2' 'libserialport')
makedepends=('glibc' 'git' 'cmake')
provides=("amiberry=${pkgver}")
conflicts=('amiberry')
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

build() {
  cd $pkgname
  make PLATFORM=x86-64
}

package() {
  sudo mkdir -p "/opt/${pkgname}"
  cd "${srcdir}/${pkgname}"
  sudo cp -r * "/opt/${pkgname}"
  @echo "Emulator is installed in /opt/${pkgname}"
  @echo "Run emulator through amiberry.sh"
}
