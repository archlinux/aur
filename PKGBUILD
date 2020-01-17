# Maintainer:  Maxime Poulin <maxpoulin64@gmail.com>
# Contributor: Jan Hrdina <jan.hrdka@gmail.com>
# Contributor: Gabriel B. Casella <gbc921@gmail.com>
pkgname=soundwire
pkgver=3.0.0
pkgrel=1
pkgdesc="Wirelessly transmit any audio from your PC to your Android phone or other PCs"
url="http://georgielabs.net"
arch=('x86_64')
license=('custom')
depends=('portaudio' 'qt5-base' 'curl')
optdepends=('pavucontrol')
install='soundwire.install'

source=("http://georgielabs.altervista.org/SoundWire_Server_linux64.tar.gz")
sha256sums=('e9b02910c743f764d298f9ff78caed953b8a65e0e6409c1067d427e4ded4d868')

package() {
  cd "${srcdir}/SoundWireServer"

  sed -i 's/sw-icon.xpm/soundwire/' SoundWire-Server.desktop

  install -Dm644 license.txt "$pkgdir/usr/share/doc/$pkgname/license.txt"
  install -Dm644 opus_license.txt "$pkgdir/usr/share/doc/$pkgname/opus_license.txt"
  install -Dm644 README.txt "$pkgdir/usr/share/doc/$pkgname/README.txt"
  install -Dm644 sw-icon.xpm "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.xpm"
  install -Dm644 SoundWire-Server.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D SoundWireServer "$pkgdir/usr/bin/SoundWireServer"
}
# vim:set ts=2 sw=2 et:
