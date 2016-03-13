# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=litwr
pkgver=1.2.9
pkgrel=1
pkgdesc="Life in the Woods Renaissance is a modpack for Minecraft."
url="http://lifeinthewoods.ca"
arch=('any')
license=('GPLv3')
depends=('java-runtime>=7')

source=("http://lifeinthewoods.getitfromhere.co.uk/downloads/LifeInTheWoodsRenaissanceLauncher.zip")
sha512sums=('94d02ae895833ccfdd8b1b854cbcd2e517617f46f0114cb2e49111724bed127076f6651a5de34b4dfb91f2b9130bb459c1ed436b219d9a2a864c95096588c346')

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
EOF
}
