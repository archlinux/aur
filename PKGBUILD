# Maintainer: Feresey <p.milko1999@yandex.ru>

pkgname=prime
pkgdesc="PRIME Render Offload Launcher. Please visit https://download.nvidia.com/XFree86/Linux-x86_64/435.21/README/primerenderoffload.html to manually configure your Device."
url="https://download.nvidia.com/XFree86/Linux-x86_64/435.21/README/primerenderoffload.html"
pkgver=0.0
pkgrel=4
arch=(any)
license=("custom")
conflicts=(bumblebee optimus-manager)
depends=(bash xorg-server-git nvidia)
optdepends=(
"vulkan-intel: for vulkan support"
"lib32-vulkan-intel: for vulkan support")

source=(prime 10-nvidia.conf)
md5sums=('673a25aa1b271fd957b32b452cc4681f'
         '317c1136a06f746bdeb02b0914c63ab4')

package()
{
	mkdir -p "${pkgdir}"/usr/bin/
	mkdir -p "${pkgdir}"/etc/X11/xorg.conf.d/
	install -m a+xr ./prime "${pkgdir}"/usr/bin/
	cp 10-nvidia.conf "${pkgdir}"/etc/X11/xorg.conf.d/

}
