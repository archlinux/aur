#Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
#Contributor: Andrew Bueide <abueide@protonmail.com>
pkgname="gdx-texture-packer-gui"
pkgver=4.11.0
pkgrel=1
pkgdesc="A gui for the command line gdx-texturepacker"
arch=('any')
url="https://github.com/crashinvaders/gdx-texture-packer-gui"
license=('Apache')
depends=('java-runtime' 'unzip')
source=("https://github.com/crashinvaders/gdx-texture-packer-gui/releases/download/${pkgver}/gdx-texturepacker-${pkgver}.zip")
sha256sums=('e07f5d04023f515915c4d26a4284656b20dc7b5b531e05d065a82144ba3e9d3a')

prepare() {
	printf "#!/bin/sh\nexec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}.jar'\n" > ${pkgname}.sh
}

package() {
	install -Dm644 "${srcdir}/gdx-texturepacker.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
	install -Dm644 "${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
	chmod +x "${pkgdir}/usr/bin/${pkgname}"
}
