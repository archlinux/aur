# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Ryan Young <ry an. ry. young@gmail.com> (omit spaces)

pkgname=temp-throttle
pkgver=3.02
pkgrel=1
pkgdesc="A shell script for throttling system CPU frequency based on a desired maximum temperature."
arch=('any')
url="https://github.com/Sepero/temp-throttle"
license=('GPL-2.0-only')
depends=('bash')
backup=('etc/temp-throttle.conf')
source=("${pkgname}-v${pkgver}.tar.gz"::"https://github.com/Sepero/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b9602edb2d0e17f4bf1522ee58a498e558ee0a9e7cdfc3c0d7fd376c7e827182')

package() {
  cd "${pkgname}-${pkgver}"
  # Install executable
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "usr/sbin/temp-throttle"
  # Install configuration file
  install -m 755 -d "${pkgdir}/etc"
  install -m 755 -t "${pkgdir}/etc" "etc/temp-throttle.conf"
  # Install documentation
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "usr/share/doc/${pkgname%-git}/README"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "usr/share/doc/${pkgname%-git}/credits.txt"
  # Install systemd service
  install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 -t "${pkgdir}/usr/lib/systemd/system" "usr/lib/systemd/system/temp-throttle.service"
}

