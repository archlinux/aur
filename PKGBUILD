# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=nvidia-prime-rtd3pm
pkgver=1.0
pkgrel=1
pkgdesc="Configure your discrete NVIDIA GPU to power down when not in use."
arch=("any")
url="https://us.download.nvidia.com/XFree86/Linux-x86_64/525.89.02/README/dynamicpowermanagement.html"
license=("MIT")
source=(
  "80-nvidia-pm.rules"
  "nvidia-pm.conf"
  "LICENSE"
)
sha512sums=(
    'ec666ffe901985dff5576b25879acf0b620cfa68c4c932163cc431a1c2514c1952d348502f02368d7e43ed50ae51e73c873ba2167ad7c7ff3d73a9065bded73f'
    '20c45d591afeb24327ccdd62ddef64fd2533cb1c5396e5030e3443d6ee0b86740cc3383b3c74f088088058f7c9281bc0e93b9d115ff9f8525f49e205641c538f'
    'c99f1ab3ab4707199a0e767c065d10119b188e1a5a5100160ceaea753a3cc24342286606eb10d3b5dc251051f7ef922ed679823d5ca9109334d8dd9fc4dcd0be'
)

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 -t "${pkgdir}/usr/lib/udev/rules.d" 80-nvidia-pm.rules
  install -Dm644 -t "${pkgdir}/usr/lib/modprobe.d" nvidia-pm.conf
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
