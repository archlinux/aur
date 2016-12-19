# Maintainer: zoe <chp321 AT gmail DOT com>

pkgname=kf5-servicemenus-md5sha1calc
_srcname=md5sha1calc
pkgver=0.1
pkgrel=3
pkgdesc="A service menu in dolphin (right click) to compute md5sum and sha1sum of a file"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dolphin' 'kdialog' 'bash')
install=${_srcname}.install
source=(${_srcname}.sh ${_srcname}.desktop ${_srcname}.install ${_srcname}-48.png)
sha1sums=('32fb6e4c0e8a912e52135fada5193e96934164c3'
          'd65e1718ecfb0ffd21dd31565cc0aeec20e57161'
          '03a6f50b4e2ddd87cfa62a318323f3120846499e'
          '17f74c726c406e516ac59eb91f8b7dd089c466bd')

package() {
	install -D -m755 ${_srcname}.sh ${pkgdir}/usr/bin/${_srcname}
	install -D -m644 ${_srcname}.desktop "${pkgdir}/$(kf5-config --prefix)/share/kservices5/ServiceMenus/${_srcname}.desktop"
        install -D -m644 ${_srcname}-48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/${_srcname}.png
}
