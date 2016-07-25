# Contributor: Marcel Pfeiffer <pfeiffer(dot)marcel(at)gmx(dot)de>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=eclipse-emf-query
pkgver=1.10.0
_pkgdate=201606071631
pkgrel=1
pkgdesc="Eclipse Modeling Framework (Model Query subproject)"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/modeling/emf/?project=query#query"
license=('EPL')
depends=('eclipse-mdt-ocl' 'eclipse-emf')
makedepends=('unzip')
source=(http://download.eclipse.org/modeling/emf/query/downloads/drops/${pkgver}/R${_pkgdate}/emf-query-runtime-${pkgver}.zip)
md5sums=('e900d8cf3e48469a5fad72a9ad260520')

package() {
    _dest=$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/eclipse
    cd "${srcdir}/eclipse"
    mkdir -p "${_dest}"
    cp -r {features,plugins} "$_dest/"
    find "$pkgdir/usr/lib/eclipse" -type d -exec chmod 755 {} \;
    find "$pkgdir/usr/lib/eclipse" -type f -exec chmod 644 {} \;
}
