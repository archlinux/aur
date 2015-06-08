# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com>
pkgname=eclipse-emf-validation
pkgver=1.8.0
pkgrel=1
_pkgdate=201405281429
pkgdesc="Eclipse Modeling Framework (Model Validation subproject)"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/modeling/emf/?project=validation#validation"
license=('EPL')
depends=('eclipse-mdt-ocl')
makedepends=('unzip')
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=(${_mirror}/modeling/emf/validation/downloads/drops/${pkgver}/R${_pkgdate}/emf-validation-runtime-${pkgver}.zip)
md5sums=('7d8a54a2abe7ca1a60a7312d7f38064f')

package() {
  cd $srcdir/eclipse
  find . -type f -exec chmod 644 {} \; || return 1
  find . -type d -exec chmod 755 {} \; || return 1
  install -d -m755 $pkgdir/$ECLIPSE_HOME || return 1
  mv plugins features $pkgdir/$ECLIPSE_HOME || return 1
}
