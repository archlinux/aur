# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Aurelien Cibrario <aurelien.cibrario at gmail dot com>
# Contributor: David Manouchehri <manouchehri at riseup dot net>
# Contributor: Peter-Paul van Gemerden <info at ppvg dot nl>
# Contributor: Karsten Hinz <k.hinz at tu-bs dot de>

pkgname=pycam
pkgver=0.6.3
pkgrel=1
pkgdesc="Toolpath generator for 3-axis CNC machining, written in Python."
arch=('i686' 'x86_64')
url="http://pycam.sourceforge.net/"
license=('GPL3')
depends=('pygtk' 'python2-opengl' 'python2-rsvg' 'python2-gtkglext' 'python2-enum34')
source=("https://github.com/SebKuzminsky/pycam/archive/v${pkgver}.tar.gz" 
        "${pkgname}")
sha512sums=('73dc7a0fc088f467099c7af3aac34f0dae46ca8b0e2f5a9f25c2d6236f244a128e8bd46474c03329e401c15b786f2c749222064a4230fcbe2a73e2a044b965b7'
            'fbb1b026dfa821caea352f44aa5eddb34fcb8ec87e27bf1390fb791b58733c011f5476203a5195bb1e737cd6194000c8ec30ac7444f638c2b70965071757c092')


package() {
  # Application
  mkdir -p "${pkgdir}/usr/share/"
  cp -R "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/share/${pkgname}"

  # Start script
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # freedesktop.org compatibility
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/share/desktop/pycam.desktop" "${pkgdir}/usr/share/applications/pycam.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/share/mime/icons/32x32/application-sla.png" "${pkgdir}/usr/share/pixmaps/pycam.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/share/mime/application-sla.svg" "${pkgdir}/usr/share/pixmaps/pycam.svg"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/share/mime/pycam.xml" "${pkgdir}/usr/share/mime/application/pycam.xml"
}
