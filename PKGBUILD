# Maintainer: fooeyround <75762996+fooeyround@users.noreply.github.com>
# Co-maintainer: Lennard Kittner <lennard@kittner.dev>

pkgname=hyper-headset-bin
pkgver=1.10.2
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
  '8c45e221857ef91179d5552345fd54c8327ea7dc301f24f3ac5a06e07ab660e5'
  'b3cf6440fd2d957f94fc8457bd65ed7cd841fc7f482587b554405cb6a5b5caf7'
  '08e7ca1fdd0f6f62d50590afc7092e95ad9d71ebee75eacd604c5ea45462f706'
)

package() {
  install -Dm755 hyper_headset "${pkgdir}/usr/bin/hyper_headset"
  install -Dm755 hyper_headset_cli "${pkgdir}/usr/bin/hyper_headset_cli"

  install -Dm644 99-HyperHeadset-${pkgver}.rules "${pkgdir}/usr/lib/udev/rules.d/99-HyperHeadset.rules"
  
  install -Dm644 hyper-headset-${pkgver}.desktop "${pkgdir}/usr/share/applications/hyper-headset.desktop"
}

