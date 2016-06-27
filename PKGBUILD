# Contributor: Marcel Pfeiffer <pfeiffer(dot)marcel(at)gmx(dot)de>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com>
pkgname=eclipse-emf-transaction
pkgver=1.9.0
pkgrel=1
_pkgdate=201506010221
pkgdesc="Eclipse Modeling Framework (Model Transaction subproject)"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/modeling/emf/?project=transaction#transaction"
license=('EPL')
depends=('eclipse-emf-query' 'eclipse-emf-validation')
makedepends=('unzip')
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=(${_mirror}/modeling/emf/transaction/downloads/drops/${pkgver}/R${_pkgdate}/emf-transaction-runtime-${pkgver}.zip)
md5sums=('bd752b5a4e06b7a2650c9a48150ce689')

package() {
    _dest="$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/"
    cd $srcdir/eclipse
    mkdir -p "${_dest}"
    cp -r {features,plugins} "$_dest/"
    find "$pkgdir/usr/lib/eclipse" -type d -exec chmod 755 {} \;
    find "$pkgdir/usr/lib/eclipse" -type f -exec chmod 644 {} \;
}
