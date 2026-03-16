# Maintainer: fooeyround <75762996+fooeyround@users.noreply.github.com>


pkgname=hyper-headset-bin
pkgver=1.5.1
pkgrel=5
pkgdesc='HyperX headset family utilities (bin)'
arch=('x86_64')
url='https://github.com/LennardKittner/HyperHeadset'
license=('MIT')
install=${pkgname}.install
depends=('dbus' 'libusb')
provides=('hyper-headset')
conflicts=('hyper-headset')
replaces=('hyperx-cloud-ii-wireless-bin')

source=(
  "hyper_headset_Linux.zip::https://github.com/lennardkittner/hyperheadset/releases/download/v${pkgver}/hyper_headset_Linux.zip"
  "99-HyperHeadset.rules::https://raw.githubusercontent.com/lennardkittner/hyperheadset/v$pkgver/99-HyperHeadset.rules"
  "hyper-headset.desktop::https://raw.githubusercontent.com/lennardkittner/hyperheadset/v$pkgver/hyper-headset.desktop"

)
sha256sums=(
  'c1cfaab46bd1b26df334dcf5e108a241987374d76e75d14a3802ed233cfd4aa5'
  'e10de3a4762b661205de31d8970c33de9ffc4cc68c74bf4b7751469a6cd593c2'
  '08e7ca1fdd0f6f62d50590afc7092e95ad9d71ebee75eacd604c5ea45462f706'
)

package() {
  install -Dm755 hyper_headset "${pkgdir}/usr/bin/hyper_headset"
  install -Dm755 hyper_headset_cli "${pkgdir}/usr/bin/hyper_headset_cli"

  install -Dm644 99-HyperHeadset.rules "${pkgdir}/usr/lib/udev/rules.d/99-HyperHeadset.rules"
  
  install -Dm644 hyper-headset.desktop "${pkgdir}/usr/share/applications/hyper-headset.desktop"
  

}

