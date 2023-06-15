# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname='distro-grub-themes-arch'
pkgver='3.2'
pkgrel=2
pkgdesc="A GRUB2 theme for Arch Linux"
arch=('any')
url="https://github.com/AdisonCavani/distro-grub-themes"
license=('GPL3')
provides=('distro-grub-theme-arch'
		  'grub-theme-arch'
		  'grub-theme')
groups=()
depends=('grub')
optdepends=('grub-customizer: GUI tool to configure grub')

_theme_distro="arch-linux"

source=("https://github.com/AdisonCavani/distro-grub-themes/releases/download/v${pkgver}/${_theme_distro}.tar")
noextract=("${_theme_distro}.tar")
sha256sums=('e589bb946d6cd7bf6303142cf3aeeb872fef416fb36ff3e168a11bccfeae850b')


prepare() {
	mkdir -p ${_theme_distro}
	cd ${_theme_distro}
	bsdtar -xf "$srcdir"/${_theme_distro}.tar
}

# example:
# https://github.com/archlinux/svntogit-packages/blob/packages/breeze-grub/trunk/PKGBUILD
package() {
	_dest="${pkgdir}"/usr/share/grub/themes/
	install -d "${_dest}"
	cp -r ${_theme_distro} "${_dest}"
}
