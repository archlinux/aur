# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: said
# Contributor:  Kaurin <milos dot kaurin at gmail>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=filebot
pkgver=4.7.5
pkgrel=1
pkgdesc="The ultimate tool to rename TV/anime shows, download subtitles, and validate checksums."
arch=('any')
url="http://filebot.sourceforge.net/"
license=('GPL')
install=$pkgname.install

depends=('java-runtime>=8' 'fontconfig' 'chromaprint')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/FileBot_$pkgver/FileBot_$pkgver-portable.tar.xz
        $pkgname-arch.sh $pkgname.svg $pkgname.desktop)
md5sums=('8fb4f6d1cc4a136c46e1d8bc416c6df5'
         '04cbf9bfeb65877e87e26c3300b81498'
         '04f46be047049448dba3f0de29fe192d'
         'f37edd0bba7570904d28ab1681c7a7f3')
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
  install -Dm755 $pkgname-arch.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
