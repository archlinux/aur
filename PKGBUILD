# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Ryan Young <ry an. ry. young@gmail.com> (omit spaces)

pkgname=temp-throttle
pkgver=2.20
pkgrel=1
pkgdesc="A shell script for throttling system CPU frequency based on a desired maximum temperature."
arch=('any')
url="https://github.com/Sepero/temp-throttle"
license=('GPL2')
source=("${pkgname}-v${pkgver}.tar.gz"::"https://github.com/Sepero/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}@.service")
sha256sums=('4ab30f204bdf407ebbfa5abdaa3b3d780e3bc674dca0bb08dbde650ccc015cf7'
            '18ae3edd7b41508da279df6d67f1c5d86e1dbfe2daebbc42bbe39c26031b22e0')

package() {
  cd "${pkgname}-${pkgver}"
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 'temp_throttle.sh' "${pkgdir}/usr/bin/${pkgname}"
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.md"
  install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/${pkgname}@.service"
}

