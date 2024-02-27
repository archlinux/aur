# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=angie-owasp-crs
pkgver=4.0.0
pkgrel=1
pkgdesc='The OWASP CRS is a set of generic attack detection rules for use with ModSecurity or compatible web application firewalls.'
arch=("any")
url='https://github.com/coreruleset/coreruleset/'
license=('Apache License 2.0')
source=("https://github.com/coreruleset/coreruleset/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('c25bfd6de772815977783e78d7afd388d60bbba151762a38c7050fd5ecde6a48baa0a850028a24d42855ae4a788404ad1ee0f7a4ad2d94d53a46e261a00f7224')
backup=("etc/nginx/crs-setup.conf")
install="angie-owasp-crs.install"
package() {
  install -Dm644 "${srcdir}/coreruleset-${pkgver}/crs-setup.conf.example" "${pkgdir}/etc/nginx/crs-setup.conf"
  mkdir -p ${pkgdir}/usr/lib/nginx/modsecurity/crs/
  cp -r ${srcdir}/coreruleset-${pkgver}/{plugins,regex-assembly,rules} ${pkgdir}/usr/lib/nginx/modsecurity/crs/
  install -Dm644 "${srcdir}/coreruleset-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
