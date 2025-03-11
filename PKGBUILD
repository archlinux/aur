# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname='shijima-qt-bin'
__pkgname="shijima"
_pkgname="Shijima-Qt-x86_64.AppImage"
provides=(shijima-qt)
conflicts=(shijima-qt)
options=(!strip)
pkgver='0.0.3'
pkgrel='1'
pkgdesc='Cross-platform shimeji simulation Desktop pets on any device.'
arch=('x86_64')
license=('GPL')
url='https://github.com/pixelomer/Shijima-Qt'
sha256sums=('fdc0013696be6c1d30ce525461f48be8ae72553fca094b596d75edd8b6051f43')
depends=(
  'qt6-base'
  'fuse2'
  'fuse-common'
  'qt6-multimedia'
)
source=("https://github.com/pixelomer/Shijima-Qt/releases/download/v"${pkgver}"/release-linux-x86_64.zip")
prepare () {
    cd "$srcdir"
    chmod +x $_pkgname
    ./$_pkgname --appimage-extract
}
package() {
        install -d "${pkgdir}"/usr/share/"${_pkgname}"/"${_pkgdir}" "${pkgdir}/usr/bin"
	cd ..
	install -Dm644 "${__pkgname}".desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${__pkgname}".png "${pkgdir}/usr/share/icons/${__pkgname}.png"
	ln -s "$srcdir/$_pkgname" "$pkgdir/usr/bin/$__pkgname"

	}
