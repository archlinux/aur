# Maintainer: Popa Ioan Alexandru <alexioanpopa11@gmail.com>

pkgname=freej2me
pkgver=2018_09_07
pkgrel=1
pkgdesc="A J2ME emulator"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/freej2me/"
license=('GPL')
depends=('java-runtime')
makedepends=('unzip')
source=("https://downloads.sourceforge.net/project/freej2me/freej2me_2018-09-07.zip" 'freej2me' 'freej2me.desktop')
#the program is written in java, so providing directly binaries is ok
noextract=('freej2me_2018-09-07.zip')
md5sums=('fc176b93828a799e6c7e79506a2f2f4f'
         '68e28dc9d95056113b555d37cb58df0d'
         'a8ecd3ae8c6f97b4ccf967f43c1cdcc7')
build() {
    #get the binary .jar from the official archive, and the logo as well
    unzip -j freej2me_2018-09-07.zip freej2me/build/freej2me.jar -d ${srcdir}
    unzip -j freej2me_2018-09-07.zip freej2me/resources/org/recompile/icon.png -d ${srcdir}
}
package() {
    #install jar executable from extracted zip archive
    install -Dm644 freej2me.jar ${pkgdir}/usr/share/java/freej2me/freej2me.jar
    #install freej2me command
    install -Dm755 freej2me ${pkgdir}/usr/bin/freej2me
    #add logo
    install -Dm644 icon.png ${pkgdir}/usr/share/pixmaps/freej2me.png
    #add .desktop entry
    install -Dm644 freej2me.desktop ${pkgdir}/usr/share/applications/freej2me.desktop
}
