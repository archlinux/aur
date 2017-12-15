# Maintainer: Frontier (frontier314 at gmail dot com)

pkgname=jaspersoftstudio
_pkgname=JaspersoftStudio
_binname="Jaspersoft Studio"
pkgver=6.5.0
pkgrel=1
pkgdesc="Eclipse based Jasper Reports generator"
arch=('i686' 'x86_64')
url="http://community.jaspersoft.com/project/jaspersoft-studio"
license=('Eclipse')
depends=('java-runtime' 'gtk2')
source_x86_64=("http://sourceforge.net/projects/jasperstudio/files/JaspersoftStudio-${pkgver}/TIB_js-studiocomm_${pkgver}.final_linux_x86_64.tgz")
source_i686=("http://sourceforge.net/projects/jasperstudio/files/JaspersoftStudio-${pkgver}/TIB_js-studiocomm_${pkgver}.final_linux_x86.tgz")
md5sums_x86_64=('211040d3d99cef2821aab4b5daf56a6a')
md5sums_i686=('5be6b15839252f4b07949823ade2d05d')

package() {
install -d -m 0755 ${pkgdir}/opt/${pkgname}
cp -a ${srcdir}/TIB_js-studiocomm_${pkgver}.final/* ${pkgdir}/opt/${pkgname}
install -d -m 0755 ${pkgdir}/usr/bin
ln -sf "/opt/${pkgname}/${_binname}" ${pkgdir}/usr/bin/${pkgname}
ln -sf "/opt/${pkgname}/${_binname}" ${pkgdir}/usr/bin/${pkgname}

cat > ${_pkgname}.desktop << EoF
[Desktop Entry]
Version=${pkgver}
Encoding=UTF-8
Name=Jaspersoft Studio
Comment=${pkgdesc}
Exec=GTK2_RC_FILES=/usr/share/themes/Raleigh/gtk-2.0/gtkrc "/opt/${pkgname}/${_binname}"
Icon=/opt/${pkgname}/icon.xpm
Terminal=false
Type=Application
Categories=Java;Development;
EoF

install -D -m 0644 ${srcdir}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
