# Maintainer: Feresey <p.milko1999@yandex.ru>

pkgname=prime
pkgdesc="PRIME Render Offload Launcher"
url="https://download.nvidia.com/XFree86/Linux-x86_64/435.21/README/primerenderoffload.html"
pkgver=1.0
pkgrel=10
arch=('any')
license=("custom")
conflicts=(bumblebee)
depends=(bash)
optdepends=(
	"vulkan-intel: for vulkan support"
	"lib32-vulkan-intel: for vulkan support"
	"zsh: zsh completion")

source=(prime
		prime.install
		10-nvidia.conf
		zsh_prime
		bash_prime
		LICENSE)
md5sums=('157eb42ffd9a60c9f61be4e81d62be9d'
         '258d0f629572685b52e7f00792ac457e'
         '84d31e7be165f77f6c58fe638b4670cb'
         'bbc3d71244a5fc5d4d6caeea941ff91f'
         '6597766f7fb79d6d030fbbe20f06e7f0'
         '57d76440fc5c9183c79d1747d18d2410')

install=prime.install

package()
{
	mkdir -p "${pkgdir}"/usr/bin/
	mkdir -p "${pkgdir}"/usr/share/X11/xorg.conf.d/
	mkdir -p "${pkgdir}"/usr/share/zsh/site-functions/
	mkdir -p "${pkgdir}"/usr/share/bash-completion/completions
	mkdir -p "${pkgdir}"/usr/share/licenses/prime

	install -m a+xr ./prime "${pkgdir}"/usr/bin/
	install 10-nvidia.conf "${pkgdir}"/usr/share/X11/xorg.conf.d/
	install zsh_prime "${pkgdir}"/usr/share/zsh/site-functions/_prime
	install bash_prime "${pkgdir}"/usr/share/bash-completion/completions
	install bash_prime "${pkgdir}"/usr/share/bash-completion/completions
	install LICENSE "${pkgdir}"/usr/share/licenses/prime
}

