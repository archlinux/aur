# Maintainer: Alexandre Leconte <aleconte@dwightstudio.fr>
pkgname=jarmemu
pkgver=0.1.9
pkgrel=1
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
source=("https://github.com/Dwight-Studio/JArmEmu/releases/download/v$pkgver/JArmEmu-$pkgver-RELEASE.flatpak-arch-source.zip")
noextract=()
sha256sums=("2dad76201adbbde3e4e5e4b348545e734278a2ff69ea39d1295711eb06660f0c")

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
