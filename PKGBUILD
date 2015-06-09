# Maintainer: fqqbar

pkgname=eclipse-jautodoc
pkgver=1.12.0
pkgrel=1
pkgdesc="JAutodoc is an Eclipse Plugin for automatically adding Javadoc and file headers to your source code."
url="http://jautodoc.sourceforge.net/"
arch=('any')
license=('Eclipse Public License 1.0', 'Apache License 2.0')
depends=('eclipse')
source=("http://sourceforge.net/projects/jautodoc/files/jautodoc/${pkgver}/jautodoc_${pkgver}.zip")
sha512sums=('d963bdacde4f37b9237ae13c66600d1701502947ba7fd9d8f942c32073ea82da1cdb77149dae30ef3adf9e2c3d00beeafb4c0629b7a891299c2ccd0c3563cbbe')

# no build() needed
package() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

  cd ${srcdir}

  # Features
  find features -type f | while read _feature ; do
    install -Dm644 ${_feature} ${_dest}/${_feature}
  done

  # Plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 ${_plugin} ${_dest}/${_plugin}
  done
}
