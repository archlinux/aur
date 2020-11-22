# Maintainer: GamerTechUni <thegamertechuniverse@gmail.com>
pkgname=dmenu-gtu-git
pkgver=5.0
pkgrel=1
pkgdesc="This is a modified version of dmenu that has included useful patches like case insensitivity."
arch=(x86_64)
url="https://github.com/GamerTechUni/dmenu-gtu.git"
license=('MIT')
groups=()
depends=('sh' 'glibc' 'libx11' 'libxinerama' 'libxft' 'fontconfig' 'libfontconfig.so=1-64')
makedepends=('git' 'make')
conflicts=('dmenu')
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
	cd "dmenu-gtu"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
