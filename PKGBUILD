pkgname=devilutionx-bin
_pkgname=DevilutionX-bin
pkgver=1.5.1
pkgrel=2
_pkgrel_x86_64=1
_pkgrel_armv7h=1
_pkgrel_aarch64=1
pkgdesc="Modern open source Engine to play Diablo. You will need to provide your own game files to play Diablo. Please go to https://github.com/diasurgical/devilutionX for documentation"
arch=('x86_64' 'i386' 'aarch64')
url="https://github.com/diasurgical/devilutionX"
conflicts=("devilutionx" "devilutionx-git")
license=('GPL')
depends=('sdl2' 'sdl2_image')
makedepends=('unzip')
sha256sums_x86_64=('SKIP')
sha256sums_i386=('SKIP')
sha256sums_aarch64=('SKIP')
source_x86_64=("https://github.com/diasurgical/devilutionX/releases/download/$pkgver/devilutionx-linux-x86_64.tar.xz")
source_i386=("https://github.com/diasurgical/devilutionX/releases/download/$pkgver/devilutionx-linux-i386.tar.xz")
source_aarch64=("https://github.com/diasurgical/devilutionX/releases/download/$pkgver/devilutionx-linux-aarch64.tar.xz")


package() {
	install -dm755 "$pkgdir/usr/share/games/DevilutionX"
    install -dm755 "$pkgdir/usr/bin"
    cd $srcdir

if [[ $arch == x86_64* ]]; then
   cp -r {devilutionx,devilutionx.mpq,discord_game_sdk.so,devilutionx.sh} $pkgdir/usr/share/games/DevilutionX
  # Link to binary
   ln -s "/usr/share/games/DevilutionX/devilutionx.sh" "$pkgdir/usr/bin/devilutionx"

elif [[ $arch == i*86 ]]; then
    cp -r {devilutionx,devilutionx.mpq} $pkgdir/usr/share/games/DevilutionX
  # Link to binary
   ln -s "/usr/share/games/DevilutionX/devilutionx" "$pkgdir/usr/bin/devilutionx"

elif [[ $arch == aarch64 ]]; then
   cp -r {devilutionx,devilutionx.mpq} $pkgdir/usr/share/games/DevilutionX
  # Link to binary
   ln -s "/usr/share/games/DevilutionX/devilutionx" "$pkgdir/usr/bin/devilutionx"
else
   echo "Unknown architecture"
fi
}