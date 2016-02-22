# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=litwr
pkgver=20160213
pkgrel=2
pkgdesc="Life in the Woods Renaissance is a modpack for Minecraft."
url="http://lifeinthewoods.ca"
arch=('any')
license=('GPLv3')
depends=('java-runtime>=7')

source=("http://lifeinthewoods.getitfromhere.co.uk/downloads/LifeInTheWoodsRenaissanceLauncher.zip")
sha512sums=('7a3e450bfacfefa65290a9d683989f1362edfb0d1d45cbae8bd4bceb271e72a6f27ad3b3e124dc8092e58c8732edead236a0ccc67927840e7466cc3253bdfa8b')

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
