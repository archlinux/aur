# Maintainer: Parker Rowen <gitporker@gmail.com>
pkgname=openwork
pkgver=0.11.129
pkgrel=2
pkgdesc="An Open source alternative to Claude Cowork"
arch=('x86_64')
url="https://github.com/different-ai/openwork"
license=('MIT')
depends=('gtk3' 'glib2' 'libayatana-appindicator' 'libsoup3' 'webkit2gtk-4.1' 'openssl' 'dbus' 'librsvg')

source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/openwork-desktop-linux-amd64.deb")
sha256sums=('1624934a0c6bb53a1371e6b895481770415c8ec2fc909777ccd76b4d629328c6')
noextract=("${pkgname}-${pkgver}.deb")

package() {
# Avoids permission issues
  cd "${srcdir}"
  bsdtar -O -xf "${pkgname}-${pkgver}.deb" 'data.tar*' | bsdtar -C "${pkgdir}" -xf -
  if [ -f /usr/bin/opencode ]; then rm -f "${pkgdir}/usr/bin/opencode"; fi;
}
