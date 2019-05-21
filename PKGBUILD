#Maintainer: Andrew Bueide <abueide@protonmail.com>
pkgname="gdx-texture-packer-gui"
pkgver=4.8.2
pkgrel=1
pkgdesc="A gui for the command line gdx-texturepacker"
arch=('x86_64')
url="https://github.com/crashinvaders/gdx-texture-packer-gui"
license=('Apache')
depends=('java-runtime' 'unzip')

md5sums=('1ef303640f20e99d702c3a58ce467dc0')

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
