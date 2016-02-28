# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=litwr
pkgver=20160228
pkgrel=1
pkgdesc="Life in the Woods Renaissance is a modpack for Minecraft."
url="http://lifeinthewoods.ca"
arch=('any')
license=('GPLv3')
depends=('java-runtime>=7')

source=("http://lifeinthewoods.getitfromhere.co.uk/downloads/LifeInTheWoodsRenaissanceLauncher.zip")
sha512sums=('74a92ec228982860f528a8a5df7458f55d89ef454ee340781e7810464378b95bd0dd9e5d766aa3783539716b6572186b42a38dbf530dd4c7f0d07af001122989')

package() {
	install -d "${pkgdir}"/{opt/litwr,usr/{bin,share/{applications,licenses}}}
	install -m644 "${srcdir}"/litwrl.jar "${pkgdir}"/opt/litwr/litwrl.jar
	install -m644 "${srcdir}"/utils/appicon.png "${pkgdir}"/opt/litwr/appicon.png
	cat > "${pkgdir}"/usr/bin/litwr <<EOF
#!/usr/bin/env sh
cd /opt/litwr
java -jar /opt/litwr/litwrl.jar
EOF
	cat > "${pkgdir}"/usr/share/applications/litwr.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name="Life in the Woods Renaissance"
Comment="Starts the launcher of Life in the Woods Renaissance"
Exec=/usr/bin/java -jar /opt/litwr/litwrl.jar
Icon=/opt/litwr/appicon.png
Path=/opt/litwr
Terminal=false
StartupNotify=false
EOF
}
