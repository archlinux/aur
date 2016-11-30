# Maintainer: Max Bruckner (FSMaxB)
# Original author: archtux <antonio dot arias99999 at gmail dot com>

pkgname=freac
_realpkgver=20161129
pkgver=cvs_${_realpkgver}
pkgrel=1
pkgdesc="Audio converter and CD ripper with support for various popular formats and encoders."
arch=('i686' 'x86_64')
url="http://www.freac.org/"
license=('GPL2')
depends=('alsa-lib' 'gtk3' 'libxmu')

source=(freac
        freac.desktop
        freaccmd
        freac-translator)
source_i686=( "http://sourceforge.net/projects/bonkenc/files/snapshots/${_realpkgver}/freac-${_realpkgver}-linux.tar.gz" )
source_x86_64=( "http://sourceforge.net/projects/bonkenc/files/snapshots/${_realpkgver}/freac-${_realpkgver}-linux-x64.tar.gz" )
sha512sums=('6b8e3f3c2e53e6b9a17b0c1fd1029c0e65b6e1cf2ae5ee95bcbecc508b37c1b01d8242bc03ef557a572c47cfeb9af48d5c9f058b542c864ac5133fd7e914b843'
            '61634e759c4621dee3485ef82c584faa6d8e4b67d5240a5b929b4b166913e6ea031d03a7fd85422d4422841700d6ab140b3815e12777c53c9254ebffeb8ae021'
            '3676c271bf92bac450552ce0209e62be9ccd9db6c6cd75fa36a2b1d23dd3a7d423ee6dc1497fae59c2f28e41ee2fe334238ef523c644c60cd48602ff02520f87'
            'ef2182ec9d31c08a0bda37bbf76ce981893d1657cdbd44f346c9f2433aab3c5a618fea78f6d1d14096260d45d72487b8d0dda1582cb8d8c6b491f5499b93f0b0')
sha512sums_i686=('98e0cfd6f91985bb20f4698ed131701baec2600044f9c152ff56e32901fafa5e791d14d292dd0ed70e5189e84e088cc82bd60bade67195a6e9b731d4b3a168cc')
sha512sums_x86_64=('314ceaf57830778e8439d23136d8f04e5017f66880c81cc38591919be6f2caa19b41b255b8b122570f44c2b91d158fda6875f4f16bfcc2e5412493c7d8393701')

package() {
   cd $srcdir

   # Data files
   mkdir -p $pkgdir/usr/share/freac
   cp -r freac-$_realpkgver/* $pkgdir/usr/share/freac
   chmod -R 755 $pkgdir/usr/share/freac

   # Delete source code
   rm -rf $pkgdir/usr/share/freac/source

   # Start files
   install -Dm755 freac $pkgdir/usr/bin/freac
   install -Dm755 freaccmd $pkgdir/usr/bin/freaccmd
   install -Dm755 freac-translator $pkgdir/usr/bin/freac-translator

   # Desktop icon
   install -Dm644 freac-$_realpkgver/icons/freac.png $pkgdir/usr/share/pixmaps/freac.png
   install -Dm644 freac.desktop $pkgdir/usr/share/applications/freac.desktop
}
