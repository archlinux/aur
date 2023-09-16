#Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
#Contributor: Andrew Bueide <abueide@protonmail.com>
pkgname="gdx-texture-packer-gui"
pkgver=4.12.0
pkgrel=1
pkgdesc="A command line and GUI for packing textures"
arch=('any')
url="https://github.com/crashinvaders/gdx-texture-packer-gui"
license=('Apache')
depends=('java-runtime' 'unzip')
source=("https://github.com/crashinvaders/gdx-texture-packer-gui/releases/download/${pkgver}/gdx-texture-packer-${pkgver}-universal.zip")
sha256sums=('abdd5a7c40629fb38df3b2795f6b0890c715d9a80b0ac94943a080487f037b81')

prepare() {
	printf "#!/bin/sh\nexec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}.jar' \"\$@\"\n" > ${pkgname}.sh
}

package() {
	install -Dm644 "${srcdir}/gdx-texture-packer.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
	install -Dm644 "${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
	chmod +x "${pkgdir}/usr/bin/${pkgname}"
}
