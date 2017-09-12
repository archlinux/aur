# Maintainer: Jameson Pugh <imntreal@gmail.com>
 
pkgname=skypeforlinux-bin
pkgver=8.6.76.57286
pkgrel=1
pkgdesc="Skype for Linux WebRTC Beta"
arch=('x86_64')
url="http://www.skype.com"
license=('custom')
depends=('gtk2' 'libxss' 'gconf' 'alsa-lib' 'libxtst' 'libsecret' 'nss')
optdepends=('gnome-keyring')
conflicts=('skypeforlinux')
provides=('skypeforlinux')
source=("https://repo.skype.com/deb/pool/main/s/skypeforlinux/skypeforlinux_${pkgver}_amd64.deb")
sha256sums=('aff4b343b3c404712298b7c4664555b190e6cfcb474b79df7b21775f27baf837')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -d "${pkgdir}/usr/share/licenses/skypeforlinux-bin"
  mv "${pkgdir}/usr/share/skypeforlinux/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/skypeforlinux-bin/"
  rm -rf "${pkgdir}/opt"
}
 
# vim:set ts=2 sw=2 et:
