# Maintainer: birdsnotberries <pkg@wodeland.monster>
pkgname=byuu
pkgver=0.14
pkgrel=1
pkgdesc="a new multi-system emulator, which shares emulation cores with higan"
arch=(x86_64)
url="https://byuu.org/byuu"
license=('GPL')
groups=()
depends=(sdl2 libao libxv libpulse gtksourceview2 openal
		perl-net-dbus perl-x11-protocol)
source=("https://byuu.org/download/${pkgname}_v0r14-source.zip")
md5sums=(2986c0850bb7a8828b2ad97a12d25095)

build() {
	cd "${pkgname}_v0r14-source"
	make -C higan target=byuu
}

package() {
	cd "${pkgname}_v0r14-source"
	install -Dm 755 higan/out/byuu -t "${pkgdir}"/usr/bin
	install -Dm 644 higan/target-byuu/resource/byuu.desktop -t "${pkgdir}"/usr/share/applications/
  	install -Dm 644 higan/target-byuu/resource/byuu.png -t "${pkgdir}"/usr/share/pixmaps/
}
