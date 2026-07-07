# Maintainer: ZauJulio <zaujulio.dev@gmail.com>
pkgname=zerowhats-bin
_appname=ZeroWhats
pkgver=1.0.0
pkgrel=1
pkgdesc="A privacy-first WhatsApp Web desktop client"
arch=('x86_64')
url="https://github.com/ZauJulio/ZeroWhats"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('zerowhats')
conflicts=('zerowhats')
options=('!strip')
source=("${_appname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_appname}_${pkgver}_amd64.deb")
# Updated automatically by the release workflow; SKIP since the hash changes per release.
sha256sums=('SKIP')

package() {
  # Unpack the Debian package straight into $pkgdir.
  bsdtar -xf "${srcdir}/${_appname}_${pkgver}_amd64.deb" -C "${srcdir}"
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"
}
