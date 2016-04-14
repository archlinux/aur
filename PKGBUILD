# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=litwr
pkgver=1.2.10
pkgrel=1
pkgdesc="Life in the Woods Renaissance is a modpack for Minecraft."
url="http://lifeinthewoods.ca"
arch=('any')
license=('GPL3')
depends=('java-runtime>=7')

source=("http://lifeinthewoods.getitfromhere.co.uk/downloads/LifeInTheWoodsRenaissanceLauncher.zip")
sha512sums=('6e30e4ae21fad936c3d8243da350c75501e427bdf39de3916823085e4ca7e9e5001f41b87918081536b9d4a33b23878e048b7887555f2e10eba5adb1e9859f9a')

package() {
	install -d "${pkgdir}"/usr/{bin,share/{litwr,applications,licenses}}
	install -m644 "${srcdir}"/litwrl.jar "${pkgdir}"/usr/share/litwr/litwrl.jar
	install -m644 "${srcdir}"/utils/appicon.png "${pkgdir}"/usr/share/litwr/appicon.png
	cat > "${pkgdir}"/usr/bin/litwr <<EOF
#!/usr/bin/env sh
cd /usr/share/litwr
java -jar /usr/share/litwr/litwrl.jar
EOF
	chmod 755 "${pkgdir}"/usr/bin/litwr
	cat > "${pkgdir}"/usr/share/applications/litwr.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name="Life in the Woods Renaissance"
Comment="Starts the launcher of Life in the Woods Renaissance"
Exec=/usr/bin/java -jar /usr/share/litwr/litwrl.jar
Icon=/usr/share/litwr/appicon.png
Path=/usr/share/litwr
Terminal=false
StartupNotify=false
Categories=Games
EOF
}
