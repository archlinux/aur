# Maintainer: Jameson Pugh <imntreal@gmail.com>
 
pkgname=skypeforlinux-bin
pkgver=5.0.0.5
pkgrel=1
pkgdesc="Skype for Linux WebRTC Beta"
arch=('x86_64')
url="http://www.skype.com"
license=('custom')
depends=('gtk2' 'libxss' 'gconf' 'alsa-lib' 'libxtst' 'libgnome-keyring' 'nss')
optdepends=('gnome-keyring')
conflicts=('skypeforlinux')
provides=('skypeforlinux')
source=("https://repo.skype.com/deb/pool/main/s/skypeforlinux/skypeforlinux_${pkgver}_amd64.deb")
sha256sums=('b0efd719f91af47706002d1bcd7c256231757395610ca51b679ee95f41994a82')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -d "${pkgdir}/usr/share/licenses/skypeforlinux-bin"
  mv "${pkgdir}/usr/share/skypeforlinux/LICENSE" "${pkgdir}/usr/share/licenses/skypeforlinux-bin/"
  mv "${pkgdir}/usr/share/skypeforlinux/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/skypeforlinux-bin/"
  rm -rf "${pkgdir}/opt"
}
 
# vim:set ts=2 sw=2 et:
