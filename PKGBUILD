# Maintainer: Evgeniy "arcanis" Alexeev <arcanis.arch at gmail dot com>

pkgname=kdeplasma-applets-usu-notifications
_pkgname=usu-notifications
pkgver=0.1.3
pkgrel=1
pkgdesc="lternative KDE notifications, based on QML and org.kde.notofications, but with more features"
arch=('any')
url="http://kde-apps.org/content/show.php/?content=158063"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('unzip')
source=(http://kde-look.org/CONTENT/content-files/158063-${_pkgname}.plasmoid)
install=${pkgname}.install
md5sums=('70b3cb22f8f93613ce9952c31fd40592')

package() {
  cd "${srcdir}"
  
  mkdir -p "${pkgdir}/usr/share/apps/plasma/plasmoids/${_pkgname}"
  cp -r "${srcdir}/"{contents,platformcontents,metadata.desktop} \
        "${pkgdir}/usr/share/apps/plasma/plasmoids/${_pkgname}/"
  install -Dm644 "${srcdir}/metadata.desktop" \
                 "${pkgdir}/`kde4-config --prefix`/share/kde4/services/${_pkgname}.desktop"
}
