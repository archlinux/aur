# Maintainer: Carl Åkerlindh <carl.akerlindh at gmail dot com>
pkgname=thinlinc-client
pkgver=4.7.0
_build=5280
pkgrel=1
pkgdesc="A Linux remote desktop server built on open source technology"
arch=("x86_64")
url="https://www.cendio.com"
license=("custom")
source=("https://www.cendio.com/downloads/clients/thinlinc-client_${pkgver}-${_build}_amd64.deb")
sha256sums=("5bffb516880178487330c9ec4c63acc7585b1f87298870a778b072217353ba55")
options=(!strip)

package() {
  tar -xzf data.tar.gz -C "${pkgdir}"
  rm -rf "${pkgdir}/usr"
  install -Dm644 "$pkgdir"/opt/thinlinc/lib/tlclient/thinlinc-client.desktop "$pkgdir"/usr/share/applications/thinlinc-client.desktop
  install -Dm644 "$pkgdir"/opt/thinlinc/lib/tlclient/tlclient.svg "$pkgdir"/usr/share/pixmaps/thinlinc-client.svg
  install -Dm644 "$pkgdir"/opt/thinlinc/lib/tlclient/EULA.txt "$pkgdir"/usr/share/licences/$pkgname/EULA.txt
  chmod 755 "${pkgdir}/etc/profile.d/tlclient.sh"
  chmod 755 "${pkgdir}/etc/profile.d/tlclient.csh"
}
