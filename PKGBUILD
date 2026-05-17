# Maintainer: sysitn <thegreatandrewsh@gmail.com>
pkgname=espressif-ide-latest
pkgver=4.2.0
pkgrel=1
pkgdesc="Latest Espressif IDE for ESP32 development (Eclipse based)"
arch=('x86_64')
url="https://github.com/espressif/idf-eclipse-plugin"
license=('EPL-2.0')
depends=('jdk-openjdk' 'webkit2gtk-4.1' 'gtk2' 'gtk3' 'cmake' 'git' 'python' 'dfu-util')
source=("https://dl.espressif.com/dl/idf-eclipse-plugin/ide/Espressif-IDE-${pkgver}-linux.gtk.x86_64.tar.gz")
sha256sums=('375705fdb219f32338d2c3a05938296726fd6d3da705f4a6d28032c5')

package() {
	mkdir -p "${pkgdir}/opt/${pkgname}"
	cp -r * "${pkgdir}/opt/${pkgname}"

	mkdir -p "${pkgdir}/usr/share/applications"
	cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Type=Application
Name=Espressif-IDE (Latest)
Comment=IDE for ESP32 development
Exec=/opt/${pkgname}/Espressif-IDE
Icon=/opt/${pkgname}/icon.png
Categories=Development;IDE;
Terminal=false
StartupNotify=true
EOF

	chmod +x "${pkgdir}/opt/${pkgname}/Espressif-IDE"
}
