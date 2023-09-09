# Maintainer: Javier Carracedo <https://github.com/vircon32>
# Contributor: DeathKhan <jfoh96@gmail.com>
# Contributor: Chandler Klüser <chandler.kluser@gmail.com>

pkgname=vircon32-desktop-emulator-git
pkgver=24770a4337f52553a792bbe618377297794149ae
pkgrel=1
epoch=20230909
pkgdesc="Vircon32 Desktop Emulator"
arch=('x86_64')
url="https://github.com/vircon32/ComputerSoftware"
license=('unknown')
depends=('mesa' 'sdl2' 'sdl2_image' 'openal' 'freealut' 'tinyxml2' 'gtk2')
makedepends=('glibc' 'git' 'cmake')
provides=('vircon32-desktop-emulator')
source=("ComputerSoftware::git+$url.git")
md5sums=('SKIP')

package() {
  cd ComputerSoftware/DesktopEmulator
  mkdir build && cd build

  cmake ..
  cmake --build .
  make DESTDIR="$pkgdir" install
}
