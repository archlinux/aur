#Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
#Contributor: Andrew Bueide <abueide@protonmail.com>
pkgname="gdx-texture-packer-gui"
pkgver=4.10.1
pkgrel=1
pkgdesc="A gui for the command line gdx-texturepacker"
arch=('x86_64')
url="https://github.com/crashinvaders/gdx-texture-packer-gui"
license=('Apache')
depends=('java-runtime' 'unzip')

sha256sums=('179e1c377d9953b322ef4f150658b814f880f6c2303cb06c8993146c61b3e13f')

source=("https://github.com/crashinvaders/gdx-texture-packer-gui/releases/download/${pkgver}/gdx-texturepacker-${pkgver}.zip")

prepare() {
	printf "#!/bin/sh\nexec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}.jar'\n" > ${pkgname}.sh
}

package() {
	install -Dm644 "${srcdir}/gdx-texturepacker.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
	install -Dm644 "${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
	chmod +x "${pkgdir}/usr/bin/${pkgname}"
}
