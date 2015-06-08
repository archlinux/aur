# Maintainer: Evgeniy "arcanis" Alexeev <esalexeev@gmail.com>

pkgname=kdeplasma-wallpapers-dayandnight
_pkgname=day-and-night
pkgver=0.3
pkgrel=1
pkgdesc="Wallpaper plugin that allows you to select different wallpaper for day and night"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php?content=118636"
license=('GPL')
depends=('kdebase-workspace' 'kdebindings-python2')
source=(http://kde-look.org/CONTENT/content-files/118636-${_pkgname}.plasmoid)
install=${pkgname}.install
md5sums=('1be7e0bf85563029f1158e5685e4f256')

package()
{
  install -D -m644 "${srcdir}/metadata.desktop" \
                   "${pkgdir}/`kde4-config --prefix`/share/kde4/services/plasma-wallpaper-${_pkgname}.desktop"
  install -D -m644 "${srcdir}/metadata.desktop" \
                   "${pkgdir}/`kde4-config --prefix`/share/apps/plasma/wallpapers/${_pkgname}/metadata.desktop"
  mkdir -p "${pkgdir}/`kde4-config --prefix`/share/apps/plasma/wallpapers/${_pkgname}/contents/"{code,ui}
  install -m644 "${srcdir}/contents/code/"* \
                -t "${pkgdir}/`kde4-config --prefix`/share/apps/plasma/wallpapers/${_pkgname}/contents/code"
  install -m644 "${srcdir}/contents/ui/"* \
                -t "${pkgdir}/`kde4-config --prefix`/share/apps/plasma/wallpapers/${_pkgname}/contents/ui"
}
