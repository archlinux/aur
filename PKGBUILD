# Maintainer: sunplan
pkgname=hotdog
pkgver=20220331
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
sha256sums=('530319406e20ea9a8b0bcca4fbd1cdf0313bcd5333e0b6cda00aea8733552eed')

package() {
	tar xf data.tar.xz
	cp -r "${srcdir}/usr" "${pkgdir}/usr"
	cp -r "${srcdir}/etc" "${pkgdir}/etc"
	mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/doc"
}
