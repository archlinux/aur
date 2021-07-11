#Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
#Contributor: Andrew Bueide <abueide@protonmail.com>
pkgname="gdx-texture-packer-gui"
pkgver=4.10.0
pkgrel=1
pkgdesc="A gui for the command line gdx-texturepacker"
arch=('x86_64')
url="https://github.com/crashinvaders/gdx-texture-packer-gui"
license=('Apache')
depends=('java-runtime' 'unzip')

sha256sums=('570436defb2c00d22e34010d4cf8dcade9cdcc27146731bc29830aa92ee5f1a5')

source=("https://github.com/crashinvaders/gdx-texture-packer-gui/releases/download/${pkgver}/gdx-texturepacker-${pkgver}.zip")

prepare() {
	unzip -o gdx-texturepacker-${pkgver}.zip
	printf "#\!/bin/sh\nexec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}.jar' \"\$@\"" > ${pkgname}.sh 
}

package() {
	install -Dm644 gdx-texturepacker.jar $pkgdir/usr/share/java/${pkgname}/${pkgname}.jar
	install -Dm644 ${pkgname}.sh $pkgdir/usr/bin/${pkgname}
	chmod +x $pkgdir/usr/bin/${pkgname}
}
