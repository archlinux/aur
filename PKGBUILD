# Maintainer: Jameson Pugh <imntreal@gmail.com>
 
pkgname=skypeforlinux-bin
pkgver=1.12.0.4
pkgrel=1
pkgdesc="Skype for Linux WebRTC Alpha"
arch=('x86_64')
url="http://www.skype.com"
license=('custom')
depends=('gtk2' 'libxss' 'gconf' 'alsa-lib' 'libxtst' 'libgnome-keyring' 'nss')
optdepends=('gnome-keyring')
source=("https://repo.skype.com/deb/pool/main/s/skypeforlinux/skypeforlinux_${pkgver}_amd64.deb")
sha256sums=('5a938754e9fd96d32b0a585ff92ac34a2fe329467bddf474223bfd0620e2a89e')
 
package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -d "${pkgdir}/usr/share/licenses/skypeforlinux-bin"
  mv "${pkgdir}/usr/share/skypeforlinux/LICENSE" "${pkgdir}/usr/share/licenses/skypeforlinux-bin/"
  mv "${pkgdir}/usr/share/skypeforlinux/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/skypeforlinux-bin/"
}
 
# vim:set ts=2 sw=2 et:
