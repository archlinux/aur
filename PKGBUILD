# Maintainer: fooeyround <75762996+fooeyround@users.noreply.github.com>


pkgname=hyper-headset-bin
pkgver=1.1.0
pkgrel=3
pkgdesc='HyperX headset family utilities (bin)'
arch=('x86_64')
url='https://github.com/LennardKittner/HyperHeadset'
license=('MIT')
depends=('dbus' 'libusb' 'hidapi')
provides=('hyper-headset')
conflicts=('hyper-headset')
replaces=('hyperx-cloud-ii-wireless-bin')
#source=('git+https://github.com/LennardKittner/HyperXCloudIIWireless.git')

source=(
  "hyper_headset_Linux.zip::https://github.com/LennardKittner/HyperHeadset/releases/download/v${pkgver}/hyper_headset_Linux.zip"
  "local://99-hyperheadset.rules"
  )
sha256sums=('3770347eee639720399881e15df04fd3d8b5153e9db859288e05c670a4f41833' '69c951af8edd1fcec7812462b5dc4514bd7bce86ef16eb9518334a0fc5d3eaef')



package() {
  install -Dm755 hyper_headset "${pkgdir}/usr/bin/hyper_headset"
  install -Dm755 hyper_headset_cli "${pkgdir}/usr/bin/hyper_headset_cli"
  
  install -Dm644 99-hyperheadset.rules "${pkgdir}/usr/lib/udev/rules.d/99-hyperheadset.rules"

}

