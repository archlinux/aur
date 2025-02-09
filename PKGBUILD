pkgname=devilutionx-bin
_pkgname=DevilutionX-bin
pkgver=1.5.4
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
sha256sums_x86_64=('b0a69fba253557acd6ce32f81a9f27a0bb235de4db4dbc8919c77647f9eb4055')
sha256sums_i386=('5ecf5ba35815cb34e75470ad8133b3f8ded280198b6fbc196afa6ece55266145')
sha256sums_i686=('5ecf5ba35815cb34e75470ad8133b3f8ded280198b6fbc196afa6ece55266145')
sha256sums_pentium4=('5ecf5ba35815cb34e75470ad8133b3f8ded280198b6fbc196afa6ece55266145')
sha256sums_aarch64=('3070c39b2d0cea2f8b986fd66392fd31ce547695b36d300f13b7d13a99737a53')
source_x86_64=("https://github.com/diasurgical/devilutionX/releases/download/$pkgver/devilutionx-linux-x86_64.tar.xz")
source_i386=("https://github.com/diasurgical/devilutionX/releases/download/$pkgver/devilutionx-linux-i386.tar.xz")
source_pentium4=("https://github.com/diasurgical/devilutionX/releases/download/$pkgver/devilutionx-linux-i386.tar.xz")
source_i686=("https://github.com/diasurgical/devilutionX/releases/download/$pkgver/devilutionx-linux-i386.tar.xz")
source_aarch64=("https://github.com/diasurgical/devilutionX/releases/download/$pkgver/devilutionx-linux-aarch64.tar.xz")


package() {
   install -dm755 "$pkgdir/usr/share/diasurgical/devilutionx"
   install -dm755 "$pkgdir/usr/bin"
   install -dm755 "$pkgdir/usr/lib"
   destdir="$pkgdir/usr/share/diasurgical/devilutionx"
   find $srcdir -type f \( -name "*.so" -o -name "*.sh" \) -exec cp {} $destdir \;
   find $srcdir -type f -name "*.so" -exec cp {} $pkgdir/usr/lib \;
   ln -s /usr/lib/libsodium.so "$pkgdir/usr/lib/libsodium.so.23"
   cd $srcdir
   cp -r $srcdir/devilutionx $destdir
   cp -r $srcdir/devilutionx.mpq $destdir
   
   install -Dm755 "$srcdir/devilutionx" "$pkgdir/usr/bin"
}
