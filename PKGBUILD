# Maintainer: Albert Vaca <albertvaka@gmail.com>

pkgname=coapres
pkgver=1.2.1
pkgrel=2
pkgdesc="A real-time puzzle game about ants trying to reach their food"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/coapres/"
license=("GPL3")
depends=('jdk8-openjdk')
source=(http://downloads.sourceforge.net/project/coapres/v$pkgver/Coapres.zip
        coapres.desktop
        coapres.png
        coapres)
md5sums=('9c49a540a8b1b2ad9c378bcb90d6a06d'
         '4f22077a5fd278315552948e2c9d3201'
         '70721b89b18f908793529f0b575e4845'
         '41ae445ad08b85344eaf5ce80097dea0')

build() {
    true
}

package(){
  install -D -m644 coapres.png $pkgdir/usr/share/pixmaps/coapres.png
  install -D -m755 coapres.desktop $pkgdir/usr/share/applications/coapres.desktop
  install -D -m755 coapres $pkgdir/usr/bin/coapres

  rm Coapres/*.txt
  rm -r Coapres/res/.svn
  rm -r Coapres/res/audios/.svn
  rm -r Coapres/res/audios/sounds/.svn
  rm -r Coapres/res/audios/musics/.svn
  rm -r Coapres/res/font_sheet_infos/.svn
  rm -r Coapres/res/images/.svn
  rm -r Coapres/res/tutorial/.svn
  rm -r Coapres/res/map/.svn
  rm -r Coapres/res/txt/.svn
  mv Coapres $pkgdir/usr/share/coapres
}
