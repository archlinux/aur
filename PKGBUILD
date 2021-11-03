# Maintainer: mediaget

pkgname=mediaget
_pkgname=mediaget
pkgver=3.200.4007
#_pkgver=2
pkgrel=1
pkgdesc="radio player"
arch=('i386' 'x86_64')
url="https://zvvubuntu.blogspot.com"
license=('custom')
depends=('python-pyqt5' 'vlc') 
conflicts=("zvvradio-git")
source=("${_pkgname}_${pkgver}.tar.xz::https://mediaget.com/ld/get_installer.php?os=linux&mgsite=1&r=ms_google" "mediaget.desktop")
md5sums=('5974fa98ea6b3dbae7bee4fffb50a7d5'
         'aa7a66686c3f439f3e1c39d2069679b4')

  package() {
	cd "$srcdir"
          mkdir -p "$pkgdir"/opt
        cp -r mediaget_linux_4007 $pkgdir/opt/mediaget
       
       install -Dm755 mediaget.desktop "$pkgdir/usr/share/applications/mediaget.desktop"
       mkdir "$pkgdir"/usr/bin
       ln -s "$pkgdir/opt/mediaget/run-mediaget.sh" "$pkgdir/usr/bin/mediaget"
        #install -Dm755 $pkgname/assets/icon.png "$pkgdir/usr/share/pixmaps/photopea.png"
}

