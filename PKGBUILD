# Maintainer: Feresey <p.milko1999@yandex.ru>

pkgname=prime
pkgdesc="PRIME Render Offload Launcher. Please visit https://download.nvidia.com/XFree86/Linux-x86_64/435.21/README/primerenderoffload.html to manually configure your Device."
url="https://download.nvidia.com/XFree86/Linux-x86_64/435.21/README/primerenderoffload.html"
pkgver=0.1
pkgrel=6
arch=('any')
# license=("nothing")
conflicts=(bumblebee optimus-manager)
depends=(sh)
optdepends=(
	"vulkan-intel: for vulkan support"
	"lib32-vulkan-intel: for vulkan support")

source=(prime
		prime.install
		10-nvidia.conf)
md5sums=('e19cc7136f1e0c070de7da4a65799351'
         'd5fbf5400bdd0705fcda1ce78ec12077'
         '6bc9250bd74dcfd23a9ad4e2039681d4')

install=prime.install

package()
{
	mkdir -p "${pkgdir}"/usr/bin/
	mkdir -p "${pkgdir}"/usr/share/X11/xorg.conf.d/
	install -m a+xr ./prime "${pkgdir}"/usr/bin/
	install 10-nvidia.conf "${pkgdir}"/usr/share/X11/xorg.conf.d/
}

