# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>

pkgname=opendocman
pkgver=1.3.5
pkgrel=1
pkgdesc="Free PHP Document Management System DMS"
arch=('any')
url="http://www.opendocman.com"
license=('GPL')
depends=('php' 'apache')
makedepends=('git')
source=("https://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz/download"
        "opendocman-apache.conf")
md5sums=('SKIP' 'SKIP')

package() {
  mkdir -p ${pkgdir}/usr/share/webapps
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  mkdir -p ${pkgdir}/srv/http/document_repository
  cp -R ${srcdir}/${pkgname} ${pkgdir}/usr/share/webapps/${pkgname}
  install -D -m 644 "${srcdir}/opendocman-apache.conf" ${pkgdir}/etc/webapps/${pkgname}/opendocman-apache.conf
  install -D -m 644 "${srcdir}/${pkgname}/LICENSE.txt" ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  cp ${pkgdir}/usr/share/webapps/${pkgname}/config-sample.php ${pkgdir}/usr/share/webapps/${pkgname}/config.php
}
