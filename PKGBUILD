# Maintainer: sunplan
pkgname=hotdog
pkgver=20240222
pkgrel=3
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
source=("https://8bitoperahouse.com/download/HOTDOGbuntu_${pkgver}_amd64.deb")
md5sums=($(curl "https://8bitoperahouse.com/download/HOTDOGbuntu_${pkgver}_amd64.deb.md5" | cut -f1 -d' '))
sha256sums=('56ce2f715daedcbef03b332d87963763bf44db8bc44fb8726829162b2548a353')

package() {
	tar xf data.tar.xz
	cp -r "${srcdir}/usr" "${pkgdir}/usr"
	cp -r "${srcdir}/etc" "${pkgdir}/etc"
	mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/doc"
}
