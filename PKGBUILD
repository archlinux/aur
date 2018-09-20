# Maintainer: Jan Leszczyński <leszczu8023@gmail.com>

pkgname=crystallauncher
pkgrel=1
pkgver=1.0.0.1
pkgdesc="Crystal Launcher is a unofficial launcher for Minecraft that has own packages repository. It can also run official launcher packages."
arch=('any')
url="https://crystal-launcher.net/"
license=('CCPL')
depends=('java-runtime' 'openal' 'java-openjfx')
makedepends=('unzip')
provides=('crystallauncher')

source=("http://main.crystal-launcher.pl/releases/other/CrystalLauncher.jar"
        "crystallauncher"
        "crystallauncher.desktop"
        "crystallauncher.png"
        )
noextract=('jar')


md5sums=('SKIP'
         '59a97acf743c32226f52b374dc84803d'
         '4724472411e932b005f1b0d66a47f14e'
         '1fc2ef4be5729d96f9928af152fc1763')


pkgver() {
    echo $pkgver
}

package() {
    cd "$srcdir"

    # create folder for the main jar executable
    mkdir -p "${pkgdir}/usr/share/java/CrystalLauncher/"
    chmod -R 755 "${pkgdir}/usr/share/java/CrystalLauncher/"

    # install shell wrapper script
    install -D -m755 "${srcdir}/crystallauncher"         "${pkgdir}/usr/bin/crystallauncher"

noextract=('jar')
    # install jar
    install -D -m644 "${srcdir}/CrystalLauncher.jar" "${pkgdir}/usr/share/java/CrystalLauncher/launcher.jar"

    # install desktop launcher with icon
    install -D -m644 "${srcdir}/crystallauncher.desktop" "${pkgdir}/usr/share/applications/crystallauncher.desktop"
    install -D -m644 "${srcdir}/crystallauncher.png"     "${pkgdir}/usr/share/pixmaps/crystallauncher.png"
}
