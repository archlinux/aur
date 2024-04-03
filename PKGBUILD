# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=nvidia-prime-rtd3pm
pkgver=1.1
pkgrel=1
pkgdesc="Configure your discrete NVIDIA GPU to power down when not in use."
arch=("any")
url="https://us.download.nvidia.com/XFree86/Linux-x86_64/550.67/README/dynamicpowermanagement.html"
license=("MIT")
source=(
  "80-nvidia-pm.rules"
  "nvidia-pm.conf"
  "LICENSE"
)
sha512sums=('9cb358f06027f21ef8601c54c74ab348a638e6ec0cdbb875da9a844a06d05afe633846d49d0baa3780c1a58c459a9e60e33247a7221aeead1cf6db6e5568f378'
            '20c45d591afeb24327ccdd62ddef64fd2533cb1c5396e5030e3443d6ee0b86740cc3383b3c74f088088058f7c9281bc0e93b9d115ff9f8525f49e205641c538f'
            'c99f1ab3ab4707199a0e767c065d10119b188e1a5a5100160ceaea753a3cc24342286606eb10d3b5dc251051f7ef922ed679823d5ca9109334d8dd9fc4dcd0be')

package() {
  cd ${srcdir}
  install -Dm644 -t "${pkgdir}/usr/lib/udev/rules.d" 80-nvidia-pm.rules
  install -Dm644 -t "${pkgdir}/usr/lib/modprobe.d" nvidia-pm.conf
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
