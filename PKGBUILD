# Maintainer: Your Name <tjmcgrew@gmail.com>
pkgname=famistudio-bin
_pkgname=FamiStudio
pkgver=2.2.1
pkgrel=1
epoch=
pkgdesc="A very simple music editor for the Nintendo Entertainment System or Famicom"
arch=(x86_64)
url="https://famistudio.org/"
license=('MIT')
groups=()
depends=(mono gtk-sharp-2 openal libcanberra)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/BleuBleu/FamiStudio/releases/download/$pkgver/$_pkgname${pkgver//\./}-LinuxAMD64.zip"
    "famistudio.desktop" "FamiStudio.svg")
noextract=()

md5sums=("cb90fc1a9faabffdbf87039cbe8ea8a3"
         "0cd09f49a8decc3d9662383c58fdad08"
         "a1156aa440fcc359acc3d43dbfd2d6f9")
sha256sums=("cad4a216b61be0c1123c29e850c2a61befcfac57fed8c694c8a101671088ea05"
            "ac1dfe1899aac2f3fbdd9c591d6203ccb912be0fe617a337166efb59957a66b5"
            "f8c86d1a851dd1321d3bf3ac3f704abc398d5297b620ef444d2eea0de5e58bf8")

validpgpkeys=()

package() {
    mkdir -p $pkgdir/usr/share/applications $pkgdir/usr/share/famistudio/ \
        $pkgdir/usr/bin
    cp famistudio.desktop $pkgdir/usr/share/applications/
    cp -r "Demo Songs" FamiStudio.exe FamiStudio.exe.config libNesSndEmu.so \
        libNotSoFatso.so libopenal32.so librtmidi.so LICENSE LinuxReadme.txt \
        OpenTK.dll Resources FamiStudio.svg "$pkgdir/usr/share/famistudio"
    echo -e "#!/bin/sh\n\nmono /usr/share/famistudio/FamiStudio.exe" > $pkgdir/usr/bin/famistudio
    chmod +x $pkgdir/usr/bin/famistudio
}
