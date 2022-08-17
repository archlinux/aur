# Maintainer: Alexey Peschany <archlinux at sandboiii dot xyz>
# Contributor: jmcb <joelsgp@protonmail.com>

pkgname='distro-grub-themes-endeavouros'
pkgver='3.2'
pkgrel=1
pkgdesc="A GRUB2 theme for EndeavourOS"
arch=('any')
url="https://github.com/AdisonCavani/distro-grub-themes"
license=('GPL3')
provides=('distro-grub-theme-endeavouros'
		  'grub-theme-endeavouros'
		  'grub-theme')
groups=()
depends=('grub')
optdepends=('grub-customizer: GUI tool to configure grub')

_theme_distro="endeavouros"
_tar_name="${_theme_distro}-${pkgver}.tar"

source=("${_tar_name}::https://github.com/AdisonCavani/distro-grub-themes/releases/download/v${pkgver}/${_theme_distro}.tar")
noextract=("${_tar_name}")
sha256sums=('SKIP')


prepare() {
	mkdir -p ${_theme_distro}
	bsdtar --cd "${_theme_distro}" -xf "${_tar_name}"
}

# example:
# https://github.com/archlinux/svntogit-packages/blob/packages/breeze-grub/trunk/PKGBUILD
package() {
	_dest="${pkgdir}"/usr/share/grub/themes/
	install -d "${_dest}"
	cp -r ${_theme_distro} "${_dest}"
}
