# Maintainer: fooeyround <75762996+fooeyround@users.noreply.github.com>
# Co-maintainer: Lennard Kittner <lennard@kittner.dev>

pkgname=hyper-headset-bin
pkgver=1.10.0
pkgrel=1
pkgdesc='A CLI and tray application for monitoring and managing HyperX headsets. (bin)'
arch=('x86_64')
url='https://github.com/LennardKittner/HyperHeadset'
license=('MIT')
install=${pkgname}.install
depends=('dbus' 'libusb')
provides=('hyper-headset')
conflicts=('hyper-headset')
replaces=('hyperx-cloud-ii-wireless-bin')

source=(
  "hyper_headset_Linux-${pkgver}.zip::https://github.com/lennardkittner/hyperheadset/releases/download/v${pkgver}/hyper_headset_Linux.zip"
  "99-HyperHeadset-${pkgver}.rules::https://raw.githubusercontent.com/lennardkittner/hyperheadset/v$pkgver/99-HyperHeadset.rules"
  "hyper-headset-${pkgver}.desktop::https://raw.githubusercontent.com/lennardkittner/hyperheadset/v$pkgver/hyper-headset.desktop"
)

sha256sums=(
  '768f6cd4c51f351352fdcff95b226df2c1a813ee6c3b13bb3cbb3a54dace808d'
  '80eff3766de742f6735304e64fad06d6129096cadd9fe5d69f6f181ddf79a13e'
  '08e7ca1fdd0f6f62d50590afc7092e95ad9d71ebee75eacd604c5ea45462f706'
)

package() {
  install -Dm755 hyper_headset "${pkgdir}/usr/bin/hyper_headset"
  install -Dm755 hyper_headset_cli "${pkgdir}/usr/bin/hyper_headset_cli"

  install -Dm644 99-HyperHeadset-${pkgver}.rules "${pkgdir}/usr/lib/udev/rules.d/99-HyperHeadset.rules"
  
  install -Dm644 hyper-headset-${pkgver}.desktop "${pkgdir}/usr/share/applications/hyper-headset.desktop"
}

