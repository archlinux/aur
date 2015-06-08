# Contributor: Marcel Pfeiffer <pfeiffer(dot)marcel(at)gmx(dot)de>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com>
pkgname=eclipse-emf-transaction
pkgver=1.8.0
pkgrel=1
_pkgdate=201405281451
pkgdesc="Eclipse Modeling Framework (Model Transaction subproject)"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/modeling/emf/?project=transaction#transaction"
license=('EPL')
depends=('eclipse-emf-query' 'eclipse-emf-validation')
makedepends=('unzip')
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=(${_mirror}/modeling/emf/transaction/downloads/drops/${pkgver}/R${_pkgdate}/emf-transaction-runtime-${pkgver}.zip)
md5sums=('cf9b7c37487f08ae1e578f7f91b85780')

package() {
  cd $srcdir/eclipse
  find . -type f -exec chmod 644 {} \; || return 1
  find . -type d -exec chmod 755 {} \; || return 1
  install -d -m755 $pkgdir/$ECLIPSE_HOME || return 1
  mv plugins features $pkgdir/$ECLIPSE_HOME || return 1
}
