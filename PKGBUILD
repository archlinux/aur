# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: said
# Contributor:  Kaurin <milos dot kaurin at gmail>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=filebot
pkgver=4.7.7
pkgrel=3
pkgdesc="The ultimate tool to rename TV/anime shows, download subtitles, and validate checksums."
arch=('i686' 'x86_64' 'armv7h')
url="http://filebot.sourceforge.net/"
license=('GPL')
install=$pkgname.install
depends=('java-runtime>=8' 'fontconfig' 'chromaprint')

[[ $CARCH == "i686" ]] && _intarch=x86
[[ $CARCH == "x86_64" ]] && _intarch=x86-64
[[ $CARCH == "armv7h" ]] && _intarch=arm

source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/FileBot_$pkgver/FileBot_$pkgver-portable.tar.xz
        $pkgname-arch.sh $pkgname.svg $pkgname.desktop)
source_i686+=(https://github.com/java-native-access/jna/raw/090b24870896dd719a5b5c6d2181ba0d4bb8d767/lib/native/linux-x86.jar)
source_x86_64+=(https://github.com/java-native-access/jna/raw/3fa90d76f5c44523eaa619e68ad8ad81b5a0dc94/lib/native/linux-x86-64.jar)
source_armv7h+=(https://github.com/java-native-access/jna/raw/0547a9c3e24bd1219b54e92b3e38b14c477e21f8/lib/native/linux-arm.jar)

md5sums=('58d35910d5d164454c7840122a17dace'
         '3b51756c50a54447a5e6fb6c052e3453'
         '04f46be047049448dba3f0de29fe192d'
         'f37edd0bba7570904d28ab1681c7a7f3')
md5sums_i686=('588794d32336fcc6029a7e6591265c79')
md5sums_x86_64=('6e0b830e108ab05c8bdccd9902258882')
md5sums_armv7h=('1c141c8ac6a659b3b593fece54270709')

#noextract=(FileBot_$pkgver.jar)
optdepends=('libzen: Support for additional subtitle search engines (Sublight)'
	    'libmediainfo: Episode naming / Sublight usage'
	    'java-p7zip-binding: Extract archives'
	    'gvfs: gvfs backends')

build() {
  /bin/true
}

package() {
  cd "$srcdir"
  install -Dm644 FileBot.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm644 libjnidispatch.so "$pkgdir/usr/share/java/$pkgname/libjnidispatch.so"
  install -Dm755 $pkgname-arch.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
