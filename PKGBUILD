# Maintainer: mediaget

pkgname=mediaget
#_pkgname=mediaget
pkgver=3.200.4007
#_pkgver=2
pkgrel=3
pkgdesc="torrent player torrent-client"
arch=('i386' 'x86_64')
url="https://mediaget.com/"
license=('custom')
depends=('python-pyqt5' 'vlc') 
#conflicts=("zvvradio-git")
source=("${_pkgname}_${pkgver}.tar.xz::https://mediaget.com/ld/get_installer.php?os=linux&mgsite=1&r=ms_google" "mediaget.desktop" "mediaget")
md5sums=('5974fa98ea6b3dbae7bee4fffb50a7d5'
         'aa7a66686c3f439f3e1c39d2069679b4'
         '70f419b3a15bee508f8bd1beb3b85342')

  package() {
	cd "$srcdir"
          mkdir -p "$pkgdir"/opt
        cp -r mediaget_linux_4007 $pkgdir/opt/mediaget
       
       install -Dm755 mediaget.desktop "$pkgdir/usr/share/applications/mediaget.desktop"
       mkdir "$pkgdir"/usr/bin
        install -Dm755 mediaget "$pkgdir/usr/bin/mediaget"
}

