# Maintainer: Feresey <p.milko1999@yandex.ru>

pkgname=prime
pkgdesc="PRIME Render Offload Launcher. Please visit https://download.nvidia.com/XFree86/Linux-x86_64/435.21/README/primerenderoffload.html to manually configure your Device."
url="https://download.nvidia.com/XFree86/Linux-x86_64/435.21/README/primerenderoffload.html"
pkgver=0.1
pkgrel=4
arch=(any)
# license=("nothing")
conflicts=(bumblebee optimus-manager)

depends=(bash nvidia)
optdepends=(
"vulkan-intel: for vulkan support"
"lib32-vulkan-intel: for vulkan support")

source=(prime 10-nvidia.conf)
md5sums=('4b829fb76d018a9e565eb96a42df4555'
         '9b0995893478ebfe4d26bc3318c18d3e')

package()
{
	mkdir -p "${pkgdir}"/usr/bin/
	mkdir -p "${pkgdir}"/usr/share/X11/xorg.conf.d/
	install -m a+xr ./prime "${pkgdir}"/usr/bin/
	cp 10-nvidia.conf "${pkgdir}"/usr/share/X11/xorg.conf.d/

}
