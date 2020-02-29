# Maintainer: birdsnotberries <pkg@wodeland.monster>
pkgname=byuu
pkgver=1.4
_zipver=1r4
pkgrel=1
pkgdesc="a new multi-system emulator, which shares emulation cores with higan"
arch=(x86_64)
url="https://byuu.org/byuu"
license=('GPL')
groups=()
depends=(sdl2 libao libxv libpulse gtksourceview2 openal
		perl-net-dbus perl-x11-protocol)
source=("https://byuu.org/download/byuu/${pkgname}_v${_zipver}-source.zip")
md5sums=(fdf467be05c66cf06ac2df08d41c93ed)

build() {
	cd "${srcdir}/${pkgname}_v${_zipver}-source"
	make -C higan target=byuu
}

package() {
	cd "${srcdir}/${pkgname}_v${_zipver}-source"
	install -Dm 755 higan/out/byuu -t "${pkgdir}"/usr/bin
	install -Dm 644 higan/target-byuu/resource/byuu.desktop -t "${pkgdir}"/usr/share/applications/
  	install -Dm 644 higan/target-byuu/resource/byuu.png -t "${pkgdir}"/usr/share/pixmaps/
}
