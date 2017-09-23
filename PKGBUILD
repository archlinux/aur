# Maintainer: Michael Kogan <michael dot kogan at gmx dot net>
# Contributor: Jameson Pugh <imntreal@gmail.com>
 
pkgname=skypeforlinux-beta-bin
pkgver=5.5.0.1
pkgrel=1
pkgdesc="Skype for Linux WebRTC Beta, the older 5.x.x series - for users who experience problems with the new 8.x.x series"
arch=('x86_64')
url="http://www.skype.com"
license=('custom')
depends=('gtk2' 'libxss' 'gconf' 'alsa-lib' 'libxtst' 'libsecret' 'nss')
optdepends=('gnome-keyring')
conflicts=('skypeforlinux' 'skypeforlinux-bin')
provides=('skypeforlinux' 'skypeforlinux-bin')
source=("https://repo.skype.com/deb/pool/main/s/skypeforlinux/skypeforlinux_${pkgver}_amd64.deb")
sha256sums=('99ed59bfc5521f643071694a23f2387dac016038776d48ab03165c2e35c5c5e4')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -d "${pkgdir}/usr/share/licenses/skypeforlinux-bin"
  mv "${pkgdir}/usr/share/skypeforlinux/LICENSE" "${pkgdir}/usr/share/licenses/skypeforlinux-bin/"
  mv "${pkgdir}/usr/share/skypeforlinux/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/skypeforlinux-bin/"
  rm -rf "${pkgdir}/opt"
}
