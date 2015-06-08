# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com>
pkgname=eclipse-mdt-ocl
pkgver=5.0.1
pkgrel=1
_pkgdate=201406230143
pkgdesc="Eclipse Model Development Tools (Object Constraint Language subproject)"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/modeling/mdt/?project=ocl"
license=('EPL')
depends=('eclipse-mdt-uml2')
makedepends=('unzip')
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=(${_mirror}/modeling/mdt/ocl/downloads/drops/${pkgver}/R${_pkgdate}/mdt-ocl-runtime-${pkgver}.zip)
md5sums=('12c5670ba2fcbfff971b5a4d2605fd09')

package() {
  cd $srcdir/eclipse
  find . -type f -exec chmod 644 {} \; || return 1
  find . -type d -exec chmod 755 {} \; || return 1
  install -d -m755 $pkgdir/$ECLIPSE_HOME || return 1
  mv plugins features $pkgdir/$ECLIPSE_HOME || return 1
}