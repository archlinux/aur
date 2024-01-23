# Maintainer: Alexandre Leconte <aleconte@dwightstudio.fr>
pkgname=jarmemu
pkgver=0.1.10
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
source=("https://github.com/Dwight-Studio/JArmEmu/releases/download/v$pkgver/JArmEmu-$pkgver-$pkgrel.flatpak-arch-source.zip")
noextract=()
sha256sums=("314e77ff0237615f3e24ddc1a84198c196a74d6f44636d94b9185b0bef9a8985")

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
