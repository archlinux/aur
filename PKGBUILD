
# Maintainer: Henri van de Munt <(firstname) @ gmail.com>

pkgname=easyeda
pkgver=2.0.0
pkgrel=0
pkgdesc="EasyEDA Desktop Client, A Simple and Powerful Electronic Circuit Design Tool"
arch=('x86_64')
license=(custom)
depends=(gconf)
url="https://easyeda.com/page/download"
options=('!strip')

source=(https://image.easyeda.com/files/easyeda-client-linux-x64.zip)
sha256sums=('SKIP')

package() {
	cd "${srcdir}"

	install -d -m755 "${pkgdir}/opt/${pkgname}"

	unzip -qqd ${pkgdir}/opt/${pkgname} easyeda-linux-x64.zip

	install -d -m755 "${pkgdir}/usr/share/applications"

cat <<EOF > "${pkgdir}/usr/share/applications/easyeda-${pkgver}.desktop"
[Desktop Entry]
Categories=Development;Electronics;
Comment=A Simple and Powerful Electronic Circuit Design Tool
Exec=/opt/easyeda/easyeda %f
Terminal=false
Keywords=PCB;EasyEDA;
GenericName=EasyEDA
Icon=/opt/easyeda/icon/128x128/easyeda.png
Name=EasyEDA ${pkgver}
Type=Application
Name[en_US]=EasyEDA
EOF

}
