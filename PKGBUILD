# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Artem A. Klevtsov <unikum.pm at gmail dot com>

pkgname=kdeicons-nouvekdegray
_pkgname=nouveKDEGray
# it doesnt have a normal versionship
pkgver=20140129
pkgrel=1
pkgdesc="This is a version of the KDE4 port of the 'Reflektions' icons"
arch=('any')
url="http://kde-look.org/content/show.php?content=157454"
license=('GPL')
makedepends=('p7zip')
source=("http://fc07.deviantart.net/fs71/f/2014/029/f/6/nouvekdegray_by_tsujan-d5y0sw4.7z")
md5sums=('d34cfcaf3cfaf4a3f75cc0d1d746ad00')

package() {
  install -d "${pkgdir}/usr/share/icons"
  cp -r "${_pkgname}" "${pkgdir}/usr/share/icons/"
  
  rm "${pkgdir}/usr/share/icons/${_pkgname}/"{GPL,INSTALL}
  
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;
}
