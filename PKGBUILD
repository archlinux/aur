# Maintainer: zoe <chp321 AT gmail DOT com>

pkgname=kf5-servicemenus-md5sha1calc
_srcname=md5sha1calc
pkgver=0.2
pkgrel=1
pkgdesc="A service menu in dolphin (right click) to compute md5sum and sha1sum of a file"
arch=('i686' 'x86_64')
license=('GPL')
depends=('coreutils' 'plasma-workspace' 'dolphin' 'kdialog' 'bash')
install=${_srcname}.install
source=(${_srcname}.sh ${_srcname}.desktop ${_srcname}.install ${_srcname}-48.png)
sha1sums=('5aa0022ee87b6b579c73dd6407cb2fe0e873b16c'
          'd65e1718ecfb0ffd21dd31565cc0aeec20e57161'
          '03a6f50b4e2ddd87cfa62a318323f3120846499e'
          '17f74c726c406e516ac59eb91f8b7dd089c466bd')

package() {
	install -D -m755 ${_srcname}.sh ${pkgdir}/usr/bin/${_srcname}
	install -D -m644 ${_srcname}.desktop "${pkgdir}/$(qtpaths --install-prefix)/share/kservices5/ServiceMenus/${_srcname}.desktop"
        install -D -m644 ${_srcname}-48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/${_srcname}.png
}
