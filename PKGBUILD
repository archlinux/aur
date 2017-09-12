# Maintainer: Michael Kogan <michael dot kogan at gmx dot net>
# Contributor: Jameson Pugh <imntreal@gmail.com>
 
pkgname=skypeforlinux-beta-bin
pkgver=5.4.0.1
pkgrel=1
pkgdesc="Skype for Linux WebRTC Beta, the older 5.x.x series - for users who experience problems with the new 8.x.x series"
arch=('x86_64')
url="http://www.skype.com"
license=('custom')
depends=('gtk2' 'libxss' 'gconf' 'alsa-lib' 'libxtst' 'libsecret' 'nss')
optdepends=('gnome-keyring')
conflicts=('skypeforlinux')
provides=('skypeforlinux')
source=("https://repo.skype.com/deb/pool/main/s/skypeforlinux/skypeforlinux_${pkgver}_amd64.deb")
sha256sums=('1f31c0e9379f680f2ae2b4db3789e936627459fe0677306895a7fa096c7db2c5')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -d "${pkgdir}/usr/share/licenses/skypeforlinux-bin"
  mv "${pkgdir}/usr/share/skypeforlinux/LICENSE" "${pkgdir}/usr/share/licenses/skypeforlinux-bin/"
  mv "${pkgdir}/usr/share/skypeforlinux/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/skypeforlinux-bin/"
  rm -rf "${pkgdir}/opt"
}
