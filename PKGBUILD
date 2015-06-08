# Contributor: Marcel Pfeiffer <pfeiffer(dot)marcel(at)gmx(dot)de>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=eclipse-emf-query
pkgver=1.8.0_R201405281426
pkgrel=1
pkgdesc="Eclipse Modeling Framework (Model Query subproject)"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/modeling/emf/?project=query#query"
license=('EPL')
depends=('eclipse-mdt-ocl' 'eclipse-emf')
makedepends=('unzip')
source=(http://download.eclipse.org/modeling/emf/query/downloads/drops/${pkgver%_*}/${pkgver#*_}/emf-query-runtime-${pkgver%_*}.zip)
md5sums=('c2bf8f0ecbe05cfc5f091fc38c18ccb0')

package() {
  cd $srcdir/eclipse
  find . -type f -exec chmod 644 {} \; || return 1
  find . -type d -exec chmod 755 {} \; || return 1
  install -d -m755 $pkgdir/$ECLIPSE_HOME || return 1
  mv plugins features $pkgdir/$ECLIPSE_HOME || return 1
}
