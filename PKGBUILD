# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com>
pkgname=eclipse-emf-validation
pkgver=1.10.0
pkgrel=1
_pkgdate=201606071713
pkgdesc="Eclipse Modeling Framework (Model Validation subproject)"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/modeling/emf/?project=validation#validation"
license=('EPL')
depends=('eclipse-mdt-ocl')
makedepends=('unzip')
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=(${_mirror}/modeling/emf/validation/downloads/drops/${pkgver}/R${_pkgdate}/emf-validation-runtime-${pkgver}.zip)
md5sums=('fbb61d3179bb039d97d4d9a2a9b4da7c')

package() {
    _dest=$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/eclipse
    cd "${srcdir}/eclipse"
    mkdir -p "${_dest}"
    cp -r {features,plugins} "$_dest/"
    find "$pkgdir/usr/lib/eclipse" -type d -exec chmod 755 {} \;
    find "$pkgdir/usr/lib/eclipse" -type f -exec chmod 644 {} \;
}
