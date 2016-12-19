# Maintainer: Jameson Pugh <imntreal@gmail.com>
 
pkgname=skypeforlinux-bin
pkgver=1.14.0.5
pkgrel=2
pkgdesc="Skype for Linux WebRTC Alpha"
arch=('x86_64')
url="http://www.skype.com"
license=('custom')
depends=('gtk2' 'libxss' 'gconf' 'alsa-lib' 'libxtst' 'libgnome-keyring' 'nss')
optdepends=('gnome-keyring')
conflicts=('skypeforlinux')
provides=('skypeforlinux')
source=("https://repo.skype.com/deb/pool/main/s/skypeforlinux/skypeforlinux_${pkgver}_amd64.deb")
sha256sums=('41086b7d2c82fe1a113152e765e12afa47b77e99823fa701d218fddfb6c38514')
 
package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -d "${pkgdir}/usr/share/licenses/skypeforlinux-bin"
  mv "${pkgdir}/usr/share/skypeforlinux/LICENSE" "${pkgdir}/usr/share/licenses/skypeforlinux-bin/"
  mv "${pkgdir}/usr/share/skypeforlinux/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/skypeforlinux-bin/"
  rm -rf "${pkgdir}/opt"
}
 
# vim:set ts=2 sw=2 et:
