# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro_org>

# This PKGBUILD essentially just unpacks and repacks upstream's package with
# narrower deps

pkgname='hopper'
_pkgname='hopperv4'
pkgver='4.1.2'
pkgrel='1'
pkgdesc='Reverse engineering tool that lets you disassemble, decompile and debug your applications'
arch=('x86_64')
url='https://www.hopperapp.com/'
license=('Commercial')
depends=('hicolor-icon-theme' 'libbsd' 'python2' 'qt5-base')
provides=("${pkgname}" "${_pkgname}")
conflicts=("${pkgname}" "${_pkgname}")
source=("https://d2ap6ypl1xbe4k.cloudfront.net/Hopper-v4-${pkgver}-Linux.pkg.tar.xz")
sha256sums=('f275897adf1eb4507a71c6f5a1b2b28176e6641f5c278977c071f43dbecb015d')

package() {
  # Copy package content
  cp -r ${srcdir}/opt ${pkgdir}/opt
  cp -r ${srcdir}/usr ${pkgdir}/usr

  # Move docs to /opt
  mv ${pkgdir}/usr/share/doc/hopperv4 ${pkgdir}/opt/hopper-v4/doc
  rmdir ${pkgdir}/usr/share/doc

  #TODO locate license file
  #install -Dm644 license ${pkgdir}/usr/share/licenses/${pkgname}/license
}
