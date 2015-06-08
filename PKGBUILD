# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Tom Vincent <http://tlvince.com/contact/>

pkgname=eclipse-ivyde-ivy
pkgver=2.3.0
_pkgver=${pkgver}.final_20130110142753
pkgrel=4
pkgdesc="Ivy feature and bundle for IvyDE"
url="https://ant.apache.org/ivy/ivyde/"
arch=('any')
license=('apache')
depends=('eclipse')
source=("http://mirrors.ukfast.co.uk/sites/ftp.apache.org/ant/ivyde/updatesite/ivy-${_pkgver}/features/org.apache.ivy.eclipse.ant.feature_${_pkgver}.jar"
        "http://mirrors.ukfast.co.uk/sites/ftp.apache.org/ant/ivyde/updatesite/ivy-${_pkgver}/features/org.apache.ivy.feature_${_pkgver}.jar"
        "http://mirrors.ukfast.co.uk/sites/ftp.apache.org/ant/ivyde/updatesite/ivy-${_pkgver}/plugins/org.apache.ivy.eclipse.ant_${_pkgver}.jar"
        "http://mirrors.ukfast.co.uk/sites/ftp.apache.org/ant/ivyde/updatesite/ivy-${_pkgver}/plugins/org.apache.ivy_${_pkgver}.jar")

sha1sums=('c72daf4d5faa1be75ab3b8b425d64c4e03805592'
          '2ac2c778b1aec6588771d89169534a5bcc352de7'
          '6cdc3ad5cf9e25f2103df228662a129ebb5bc683'
          'c5ebf1c253ad4959a29f4acfe696ee48cdd9f473')

package() {
  dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse
  mkdir -p $dest/features $dest/plugins
  install -m 644 $startdir/org.apache.ivy.eclipse.ant.feature_${_pkgver}.jar $dest/features
  install -m 644 $startdir/org.apache.ivy.feature_${_pkgver}.jar $dest/features
  install -m 644 $startdir/org.apache.ivy.eclipse.ant_${_pkgver}.jar $dest/plugins
  install -m 644 $startdir/org.apache.ivy_${_pkgver}.jar $dest/plugins
}
