# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: said
# Contributor:  Kaurin <milos dot kaurin at gmail>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=filebot
pkgver=4.6
pkgrel=1
pkgdesc="The ultimate tool to rename TV/anime shows, download subtitles, and validate checksums"
arch=('any')
url="http://filebot.sourceforge.net/"
license=('GPL')

depends=('java-runtime>=8' 'fontconfig')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/FileBot_$pkgver/FileBot_$pkgver-portable.zip
        $pkgname-arch.sh $pkgname.svg $pkgname.desktop)
md5sums=('4533ee65aae5adbb7f5840be08c042a5'
         '1d5dcc2c4a045830e59c705e29c99d18'
         '04f46be047049448dba3f0de29fe192d'
         'f37edd0bba7570904d28ab1681c7a7f3')
#noextract=(FileBot_$pkgver.jar)
optdepends=('libzen: Support for additional subtitle search engines (Sublight)' 'libmediainfo: Episode naming / Sublight usage' 'java-p7zip-binding: Extract archives')

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
