# Maintainer: Mounir Erhili <mounirerhili@gmail.com>

pkgname=easyeda
pkgver=6.4.7
pkgrel=1
pkgdesc="EasyEDA Desktop Client, A Simple and Powerful Electronic Circuit Design Tool"
arch=('x86_64')
license=(custom)
depends=(gconf)
url="https://easyeda.com/page/download"
options=('!strip')

source=("https://image.easyeda.com/files/easyeda-linux-x64-${pkgver}.zip")
sha256sums=('a50d9a3e9832fe67bcb8943d0096539dbd5be8846376ec9b15a9bab9b92d115a')

package() {
	cd "${srcdir}"

	install -d -m755 "${pkgdir}/opt/${pkgname}"
	install -d -m755 "${pkgdir}/usr/share/applications"

	unzip -qqd ${pkgdir}/opt/${pkgname} easyeda-linux-x64.zip

  chmod +x "${pkgdir}/opt/${pkgname}/easyeda"

  cat <<EOF > "${pkgdir}/usr/share/applications/easyeda.desktop"
[Desktop Entry]
Categories=Development;Electronics;
Comment=A Simple and Powerful Electronic Circuit Design Tool
Exec=/opt/easyeda/easyeda %f
Terminal=false
Keywords=PCB;EASYEDA;EASY;EDA
GenericName=EasyEDA
Icon=/opt/easyeda/icon/128x128/easyeda.png
Name=EasyEDA ${pkgver}
Type=Application
Name[en_US]=EasyEDA
EOF
}
