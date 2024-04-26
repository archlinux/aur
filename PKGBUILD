# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=angie-owasp-crs
pkgver=4.2.0
pkgrel=1
pkgdesc='The OWASP CRS is a set of generic attack detection rules for use with ModSecurity or compatible web application firewalls.'
arch=("any")
url='https://github.com/coreruleset/coreruleset/'
license=('Apache License 2.0')
source=("https://github.com/coreruleset/coreruleset/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('041556b2071385c10a4b4a29ad4f926ee86f819f8b9c95f849e76b3d2724d5fc29c21a69f9eba6fd62e7f5709a109a95feca67a19d8c8d1f0410ee2987ac7a6b')
backup=("etc/nginx/crs-setup.conf")
install="angie-owasp-crs.install"
package() {
  install -Dm644 "${srcdir}/coreruleset-${pkgver}/crs-setup.conf.example" "${pkgdir}/etc/nginx/crs-setup.conf"
  mkdir -p ${pkgdir}/usr/lib/nginx/modsecurity/crs/
  cp -r ${srcdir}/coreruleset-${pkgver}/{plugins,regex-assembly,rules} ${pkgdir}/usr/lib/nginx/modsecurity/crs/
  install -Dm644 "${srcdir}/coreruleset-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
