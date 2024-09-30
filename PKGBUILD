pkgname=devilutionx-bin
_pkgname=DevilutionX-bin
pkgver=1.5.3
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_i386=1
_pkgrel_pentium4=1
_pkgrel_i686=1
_pkgrel_aarch64=1
pkgdesc="Modern open source Engine to play Diablo. You will need to provide your own game files to play Diablo. Please go to https://github.com/diasurgical/devilutionX for documentation"
arch=('x86_64' 'i386' 'i686' 'pentium4' 'aarch64')
url="https://github.com/diasurgical/devilutionX"
conflicts=("devilutionx" "devilutionx-git")
license=('GPL')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'libsodium')
makedepends=('unzip')
sha256sums_x86_64=('bb0fdfc1775fc6c6213faffca20821e264aad40112a40c69837c856c2999a17f')
sha256sums_i386=('8a1f5f5054bfb31d3d54ceb8c9053bf6bcb813eadba62d207bcd02a9a72489c0')
sha256sums_i686=('8a1f5f5054bfb31d3d54ceb8c9053bf6bcb813eadba62d207bcd02a9a72489c0')
sha256sums_pentium4=('8a1f5f5054bfb31d3d54ceb8c9053bf6bcb813eadba62d207bcd02a9a72489c0')
sha256sums_aarch64=('2767f566287b9e10bcc829012605236f73f818ade9f6eda20e51a39f6e292af1')
source_x86_64=("https://github.com/diasurgical/devilutionX/releases/download/$pkgver/devilutionx-linux-x86_64.tar.xz")
source_i386=("https://github.com/diasurgical/devilutionX/releases/download/$pkgver/devilutionx-linux-i386.tar.xz")
source_pentium4=("https://github.com/diasurgical/devilutionX/releases/download/$pkgver/devilutionx-linux-i386.tar.xz")
source_i686=("https://github.com/diasurgical/devilutionX/releases/download/$pkgver/devilutionx-linux-i386.tar.xz")
source_aarch64=("https://github.com/diasurgical/devilutionX/releases/download/$pkgver/devilutionx-linux-aarch64.tar.xz")


package() {
	install -dm755 "$pkgdir/usr/share/games/DevilutionX"
   install -dm755 "$pkgdir/usr/bin"
   install -dm755 "$pkgdir/usr/lib"
   destdir="$pkgdir/usr/share/games/DevilutionX"
   find $srcdir -type f \( -name "*.so" -o -name "*.sh" \) -exec cp {} $destdir \;
   find $srcdir -type f -name "*.so" -exec cp {} $pkgdir/usr/lib \;
   ln -s /usr/lib/libsodium.so "$pkgdir/usr/lib/libsodium.so.23"
   cd $srcdir
   cp -r $srcdir/devilutionx $destdir
   cp -r $srcdir/devilutionx.mpq $destdir
   
   install -Dm755 "$srcdir/devilutionx" "$pkgdir/usr/bin"
}
