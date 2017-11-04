# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=litwr
pkgver=1.3.11
pkgrel=1
pkgdesc="Life in the Woods Renaissance is a modpack for Minecraft."
url="http://lifeinthewoods.ca"
arch=('any')
license=('GPL3')
depends=('java-runtime>=8')

source=("http://lifeinthewoods.getitfromhere.co.uk/downloads/LifeInTheWoodsRenaissanceLauncher.zip")
sha512sums=('fd622d4ffd2d7cac1dccd29267ca2fa78f73438be244756ac5899dc8ff9916d9bebe833bda3a8f1fa04fdb983ea01363eebd45683bf6e4ba3bdc0e96f80d8d99')

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
