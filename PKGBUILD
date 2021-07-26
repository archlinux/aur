# Maintainer: Stefan Eekhof <stefaneekhof@gmail.com>
pkgname=mtk
pkgver=1.0.0

pkgrel=9
pkgdesc="MTK CLI - Command Line Interface for the Cyan Minecraft Toolkit
(NOT AN OFFICIAL MINECRAFT PRODUCT. NOT APPROVED BY OR ASSOCIATED WITH MOJANG)"
arch=( 'any' )
url=""
license=('LGPL')
groups=()
depends=( 'java-environment' )
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://aerialworks.ddns.net/ASF/Cyan.git")
noextract=()
md5sums=('SKIP')

build() {
    cd Cyan/MtkCLI
    chmod +x ../gradlew
    ../gradlew -c ../settings.lite.gradle installation
}

package() {
    mkdir "$pkgdir/usr/lib/mtk-libs/" -p
    cd Cyan/build/MTK-CLI/Installations
    
    rm *-portable
    rm *.bat
    
    mkdir -p "$pkgdir/usr/bin"
    mv mtk "$pkgdir/usr/bin"
    mv rift "$pkgdir/usr/bin"
    mv pseudocode "$pkgdir/usr/bin"
    chmod +x "$pkgdir/usr/bin/mtk"
    chmod +x "$pkgdir/usr/bin/rift"
    chmod +x "$pkgdir/usr/bin/pseudocode"
    cp -rf . "$pkgdir/usr/lib/mtk-libs"
}
