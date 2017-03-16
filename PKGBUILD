# $Id$
# Maintainer : Sergey Kostyaev <feo.me@ya.ru>

pkgname=uqm-hd-rus
pkgver=0.2
pkgrel=1
pkgdesc="The Ur-Quan Masters HD russian localization"
arch=('i686' 'x86_64')
url="http://mosc-portal.bursa.ru/showthread.php?p=1831#post1831"
license=('GPLv2')
makedepends=(unrar)
source=(http://sc.bursa.ru/download/uqm_hd/UQM_HD_Rus_10.rar
        uqm-hd-rus
        uqm-hd-rus.desktop)
md5sums=('e50464384d12dbad2b847e8318c88c5e'
         'bd85da9fe3099033188b61a9a3a03522'
         '914b4f4aeff0ec245167a0a0260a3f22')
noextract=(UQM_HD_Rus_10.rar)

package() {
  cd $srcdir
  unrar x UQM_HD_Rus_10.rar UQM_HD_Rus_10/russian10.zip
  mkdir -p $pkgdir/usr/share/games/uqm-hd/content/addons/
  install -Dm644 $srcdir/UQM_HD_Rus_10/russian10.zip $pkgdir/usr/share/games/uqm-hd/content/addons/
  install -Dm755 $srcdir/uqm-hd-rus $pkgdir/usr/bin/uqm-hd-rus
  install -Dm644 $srcdir/uqm-hd-rus.desktop \
          $pkgdir/usr/share/applications/uqm-hd-rus.desktop
}
