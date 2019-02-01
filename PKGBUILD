pkgname=nvidia-optictl
pkgver=1.0
pkgrel=1
provides=('nvidia-optictl')

_gitname=Nvidia-Optictl

pkgdesc="A set of simple scripts to control Nvidia Optimus"
url="https://github.com/Sangeppato/Nvidia-Optictl"
arch=('x86_64')
license=('GPL')

depends=('nvidia')
makedepends=('git')

source=("git+https://github.com/Sangeppato/Nvidia-Optictl")
sha256sums=('SKIP')

package() {
	cd "$_gitname"
	install -Dm 644 "src/modprobe.d/nvidia-blacklist.conf" "${pkgdir}/usr/lib/modprobe.d/nvidia-blacklist.conf"
	install -Dm 644 "src/modprobe.d/nvidia-optictl.conf" "${pkgdir}/usr/lib/modprobe.d/nvidia-optictl.conf"
	install -Dm 644 "src/systemd/nvidia-optictl.service" "${pkgdir}/usr/lib/systemd/system/nvidia-optictl.service"
	install -Dm 644 "src/tmpfiles.d/nvidia-optictl.conf" "${pkgdir}/usr/lib/tmpfiles.d/nvidia-optictl.conf"
	install -Dm 755 "src/bin/optictl" "${pkgdir}/usr/bin/optictl"
}
