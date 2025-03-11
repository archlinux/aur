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
md5sums=('b2df4dd1f546eb66c15a8f2224caf9e6')
sha256sums=('5e130677625fa346d7204e9bc1d774432168f5bf19138999b52745c72c9c540e')
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

