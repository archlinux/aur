# Maintainer: Frontier (frontier314 at gmail dot com)

pkgname=jaspersoftstudio
_pkgname=JaspersoftStudio
_binname="Jaspersoft Studio"
pkgver=6.1.0
pkgrel=1
pkgdesc="Eclipse based Jasper Reports generator"
arch=('i686' 'x86_64')
url="http://community.jaspersoft.com/project/jaspersoft-studio"
license=('Eclipse')
depends=('java-runtime' 'gtk2')
source_x86_64=("http://sourceforge.net/projects/jasperstudio/files/JaspersoftStudio-${pkgver}/TIBCOJaspersoftStudio-${pkgver}.final-linux-x86_64.tgz")
source_i686=("http://sourceforge.net/projects/jasperstudio/files/JaspersoftStudio-${pkgver}/TIBCOJaspersoftStudio-${pkgver}.final-linux-x86.tgz")
md5sums_x86_64=('01e1da5e396a07b82dbc0cd20be437de')
md5sums_i686=('2e6710b79c96f2f21880640fe8176048')

package() {
install -d -m 0755 ${pkgdir}/opt/${pkgname}
cp -a ${srcdir}/TIBCOJaspersoftStudio-${pkgver}.final/* ${pkgdir}/opt/${pkgname}
install -d -m 0755 ${pkgdir}/usr/bin
ln -sf "/opt/${_pkgname}/${_binname}" ${pkgdir}/usr/bin/${_pkgname}
ln -sf "/opt/${_pkgname}/${_binname}" ${pkgdir}/usr/bin/${pkgname}

cat > ${_pkgname}.desktop << EoF
[Desktop Entry]
Version=${pkgver}
Encoding=UTF-8
Name=Jaspersoft Studio
Comment=${pkgdesc}
Exec=GTK2_RC_FILES=/usr/share/themes/Raleigh/gtk-2.0/gtkrc /opt/${_pkgname}/${_binname}
Icon=/opt/${_pkgname}/icon.xpm
Terminal=false
Type=Application
Categories=Java;Development;
EoF

install -D -m 0644 ${srcdir}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}
