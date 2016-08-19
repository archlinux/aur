# Mantainer: Sergio Tridente <tioduke (at) gmail (dot) com>
# Contributor: Artem A. Klevtsov <unikum.pm@gmail.com>

pkgname=kde-servicemenus-getmediainfo
pkgver=0.6
pkgrel=2
pkgdesc="Simple service menu that show the mediainfo about the selected media."
arch=('any')
url="https://www.kde-look.org/p/998445/"
license=('GPL')
depends=('dolphin' 'kdebase-kdialog' 'mediainfo')
source=(https://dl.opendesktop.org/api/files/download/id/1460731799/141946-MediaInfoKDE.desktop)
md5sums=('8a14b856b510378a2dcf8bc4d2eec0c8')

prepare()
{
  sed -e 's|video/\.\*,audio/\.\*|video/*,audio/*|g' -i ${srcdir}/*-MediaInfoKDE.desktop
}

package() {
  install -Dm644 ${srcdir}/*-MediaInfoKDE.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/getmediainfo.desktop
  install -Dm644 ${srcdir}/*-MediaInfoKDE.desktop ${pkgdir}/usr/share/kde4/services/ServiceMenus/getmediainfo.desktop
}
