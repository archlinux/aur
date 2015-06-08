# Contributor: Marcel Pfeiffer <pfeiffer(dot)marcel(at)gmx(dot)de>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com>
pkgname=eclipse-mdt-uml2
pkgver=5.0.0
pkgrel=1
_pkgdate=201406020749
pkgdesc="Eclipse Model Development Tools (UML2 subproject)"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/modeling/mdt/?project=uml2#uml2"
license=('EPL')
depends=('eclipse-emf')
makedepends=('unzip')
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=(${_mirror}/modeling/mdt/uml2/downloads/drops/${pkgver}/R${_pkgdate}/mdt-uml2-runtime-${pkgver}.zip)
md5sums=('50654337ea132d7e82134e8e80e71eb0')

package() {
  cd $srcdir/eclipse
  find . -type f -exec chmod 644 {} \; || return 1
  find . -type d -exec chmod 755 {} \; || return 1
  install -d -m755 $pkgdir/$ECLIPSE_HOME || return 1
  mv plugins features $pkgdir/$ECLIPSE_HOME || return 1
}
