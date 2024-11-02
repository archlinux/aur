# Maintainer: Alexandre Leconte <aleconte@dwightstudio.fr>
pkgname=jarmemu
pkgver=1.1.3
pkgrel=1
pkgdesc="Simple ARMv7 simulator written in Java, intended for educational purpose"
arch=('any')
url="https://dwightstudio.fr/jarmemu"
license=('GPL-3')
groups=()
depends=("java-runtime>=21")
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/Dwight-Studio/JArmEmu/releases/download/v$pkgver/JArmEmu-$pkgver.zip")
noextract=()
sha256sums=("81ef6b9d71d5a903a9260af70ba31b4b41609217c80283777ddbf5cbc49d7504")

build() {
    cd $srcdir/jarmemu
}

package() {
    cd $srcdir/jarmemu

    install -d  $pkgdir/usr/share/java/$pkgname/
    install -Dm 644 *.jar $pkgdir/usr/share/java/$pkgname/
    install -Dm 644 lib/* -t $pkgdir/usr/share/java/$pkgname/lib/
    install -Dm 755 resources/$pkgname $pkgdir/usr/bin/$pkgname

    install -Dm 644 resources/icons/hicolor/scalable/apps/fr.dwightstudio.JArmEmu.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/fr.dwightstudio.JArmEmu.svg
    install -Dm 644 resources/mime/packages/fr.dwightstudio.JArmEmu.xml $pkgdir/usr/share/mime/packages/fr.dwightstudio.JArmEmu.xml
    install -Dm 644 resources/metainfo/fr.dwightstudio.JArmEmu.metainfo.xml $pkgdir/usr/share/metainfo/fr.dwightstudio.JArmEmu.metainfo.xml

    desktop-file-install --dir=$pkgdir/usr/share/applications resources/fr.dwightstudio.JArmEmu.desktop

    depends=("java-runtime>=21")
}
