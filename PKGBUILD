# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=etcher-bin
_realver=1.4.3
pkgver=${_realver//-/_}
pkgrel=1
pkgdesc="Burn images to SD cards & USB drives, safe & easy"
arch=('x86_64')
url="http://www.etcher.io/"
license=('apache')
provides=('etcher')
conflicts=('etcher')
depends=('gtk2' 'libxtst' 'libxss' 'gconf' 'nss' 'alsa-lib')
optdepends=('libnotify: for notifications'
	    'speech-dispatcher: for text-to-speech')
source_x86_64=("https://github.com/resin-io/etcher/releases/download/v${_realver}/etcher-electron_${_realver}_amd64.deb")
options=("!strip")
sha256sums_x86_64=('e57dd4654a92ae97da81b7906f24e8cd4634563338825212979af5878f0fafaa')


package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"

    mkdir -p usr/bin
    ln -s /opt/Etcher/etcher-electron usr/bin
}
