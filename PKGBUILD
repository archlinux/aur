# Maintainer: Michał Lisowski <lisu@riseup.net>
pkgname=manageyum-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Desktop application that enables you to use your online services from one app"
arch=('x86_64')
url="https://manageyum.com/"
license=('custom')
source=("${pkgname}.desktop"
       "${pkgname}.png")
source_x86_64=("https://github.com/sivaramsi/manageyum/releases/download/v2.0/manageyum-${pkgver}-linux-x64.tar.gz")
md5sums=('cb79fc22fb1a5feb03ed3cc0d07e1697'
         '1f479cf1fa50475e1f3611cef73d0a4c')
md5sums_x86_64=('2f0600fb4f7d9b3b4e5fd647ada41974')

package() {
  cd "${srcdir}"

  install -m 0755 -d ${pkgdir}/opt/${pkgname}
  install -m 0755 -d ${pkgdir}/usr/share/applications
  install -m 0755 -d ${pkgdir}/usr/share/icons
  install -m 0755 -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m 0644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications
  install -m 0644 ${srcdir}/${pkgname}.png ${pkgdir}/usr/share/icons
  install -m 0644 ${srcdir}/Manageyum-${pkgver}/LICENSE* ${pkgdir}/usr/share/licenses/${pkgname}
  cp -R ${srcdir}/Manageyum-${pkgver}/* ${pkgdir}/opt/${pkgname}
}
