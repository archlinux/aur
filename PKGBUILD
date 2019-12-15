# Maintainer: Frontier (frontier314 at gmail dot com)

pkgname=jaspersoftstudio
_pkgname=JaspersoftStudio
_binname="Jaspersoft Studio"
pkgver=6.11.0
pkgrel=1
pkgdesc="Eclipse based Jasper Reports generator"
arch=('x86_64')
url="http://community.jaspersoft.com/project/jaspersoft-studio"
license=('Eclipse')
depends=('java-runtime' 'gtk2')
source_x86_64=("https://sourceforge.net/projects/jasperstudio/files/JaspersoftStudio-${pkgver}/TIB_js-studiocomm_${pkgver}_linux_x86_64.tgz")
md5sums_x86_64=('85910894b4a6657b4ee80153c67a1fdb')

package() {
install -d -m 0755 ${pkgdir}/opt/${pkgname}
cp -a ${srcdir}/TIB_js-studiocomm_${pkgver}/* ${pkgdir}/opt/${pkgname}
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
