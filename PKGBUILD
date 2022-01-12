#Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
#Contributor: Andrew Bueide <abueide@protonmail.com>
pkgname="gdx-texture-packer-gui"
pkgver=4.10.2
pkgrel=1
pkgdesc="A gui for the command line gdx-texturepacker"
arch=('any')
url="https://github.com/crashinvaders/gdx-texture-packer-gui"
license=('Apache')
depends=('java-runtime' 'unzip')
source=("https://github.com/crashinvaders/gdx-texture-packer-gui/releases/download/${pkgver}/gdx-texturepacker-${pkgver}.zip")
sha256sums=('867809d5e88fd144ad70e98a79fe745dc15dee8afd6ef33a6a347afdbfaf4389')

prepare() {
	printf "#!/bin/sh\nexec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}.jar'\n" > ${pkgname}.sh
}

package() {
	install -Dm644 "${srcdir}/gdx-texturepacker.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
	install -Dm644 "${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
	chmod +x "${pkgdir}/usr/bin/${pkgname}"
}
