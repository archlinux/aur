# Maintainer: Alexandre Leconte <aleconte@dwightstudio.fr>
pkgname=jarmemu
pkgver=0.2.0
pkgrel=4
pkgdesc="Simple ARMv7 simulator written in Java, intended for educational purpose"
arch=('any')
url="https://dwightstudio.fr/jarmemu"
license=('GPL-3')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/Dwight-Studio/JArmEmu/releases/download/v$pkgver/JArmEmu-$pkgver-$pkgrel.flatpak-arch-source.zip")
noextract=()
sha256sums=("950fcdd77ff43021d8a643d43e57744e407d9508c73bf1f526cdca815e4040f8")

build() {
  cd "$srcdir/JArmEmu"
}

package() {
  cd "$srcdir/JArmEmu"

    mkdir -p $pkgdir/usr/share/java/JArmEmu/
    cp -r java/JArmEmu $pkgdir/usr/share/java/
    cp -r icons $pkgdir/usr/share/
    install -Dm644 mime/packages/* -t $pkgdir/usr/share/mime/packages
    install -Dm644 metainfo/* -t $pkgdir/usr/share/metainfo
    install -Dm755 jarmemu $pkgdir/usr/bin/jarmemu
    desktop-file-install --dir=$pkgdir/usr/share/applications fr.dwightstudio.JArmEmu.desktop

    depends=("java-runtime>=21")
}
