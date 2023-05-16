# Maintainer: sunplan
pkgname=hotdog
pkgver=20230414
pkgrel=1
pkgdesc='X11 Window Manager with Windows 3.1 Hot Dog Stand, Amiga Workbench, Atari ST GEM, Mac Classic and Aqua UI'
arch=('x86_64')
url='https://github.com/arthurchoung/HOTDOG'
license=('GPL3')
depends=(
	'alsa-lib'
	'libglvnd'
	'perl'
)
optdepends=(
	'compton: Aqua mode window drop shadows'
	'feh: Aqua mode wallpaper'
)
source=("https://hotdoglinux.com/download/HOTDOGbuntu_${pkgver}_amd64.deb")
md5sums=($(curl "https://hotdoglinux.com/download/HOTDOGbuntu_${pkgver}_amd64.deb.md5" | cut -f1 -d' '))
sha256sums=('60f64ceba80b76d903805e2c4073bf94e417cd504ac6053a75dd3194c4806651')

package() {
	tar xf data.tar.xz
	cp -r "${srcdir}/usr" "${pkgdir}/usr"
	cp -r "${srcdir}/etc" "${pkgdir}/etc"
	mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/doc"
}
