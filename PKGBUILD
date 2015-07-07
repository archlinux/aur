# Maintainer: fsckd <fsckdaemon -at- gmail.com>

pkgname=xcursor-protozoa
pkgver=20120114
pkgrel=1
pkgdesc="Protozoa X11 cursor theme"
arch=('any')
url="http://xfce-look.org/content/show.php/Protozoa?content=105586"
license=('GPL')
#depends=('libxcursor')

source=('http://dl.dropboxusercontent.com/u/10014823/aur/protozoa/protozoa_by_grynays-d2n7qil.zip'
        'http://dl.dropboxusercontent.com/u/10014823/aur/protozoa/protozoa_red_by_grynays-d4ma7em.zip'
        'http://dl.dropboxusercontent.com/u/10014823/aur/protozoa/protozoa_blu_and_grey_by_grynays-d2yy6sr.zip')
sha256sums=('67ccb18192dd2a8d47feaef4ffdab9c59fc93b883f35f0f9ad19acfcff73b235'
            '6aa7f533075871ca0c7f83078720059041e4846241ebc6a2f68404bc9053fd7e'
            '55f66de92b7d1f220fe2267b939bd8e7447e502caa7289782fb9486d590d31cf')

package() {
   local tgtdir="$pkgdir/usr/share/icons"
   install -d -m755 "$tgtdir"
   local cursor
   for cursor in '' '-grey' '-red' '-Blu'
   do
      bsdtar -x -C "$tgtdir" -f "$srcdir/Protozoa$cursor.tar.gz"
   done
   find "$pkgdir" -type f -exec chmod 644 '{}' +
   find "$pkgdir" -type d -exec chmod 755 '{}' +
}

# Old sources
#  http://www.deviantart.com/download/159924477/protozoa_by_grynays-d2n7qil.zip
#  http://www.deviantart.com/download/279292414/protozoa_red_by_grynays-d4ma7em.zip
#  http://www.deviantart.com/download/179634411/protozoa_blu_and_grey_by_grynays-d2yy6sr.zip
