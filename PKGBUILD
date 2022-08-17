# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=distro-grub-themes-arch
pkgver=2.8
pkgrel=2
epoch=
pkgdesc="A GRUB2 theme for Arch Linux"
arch=('any')
url="https://github.com/AdisonCavani/distro-grub-themes"
license=('GPL3')
groups=()
depends=('grub')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

_theme_distro="arch"

source=("https://github.com/AdisonCavani/distro-grub-themes/releases/download/v${pkgver}/${_theme_distro}.tar"
	    "$pkgname-$pkgver.patch")
noextract=("${_theme_distro}.tar")
sha256sums=('b6fab2d52d263e672d6bdc29635afd0a30889d428e2b5962c2cdb9d400be978a'
            '6a6e8f171636efd6955beb14503cfbbe22f62f43dc0cc15479045f22e6f1a71d')
validpgpkeys=()


prepare() {
	mkdir -p ${_theme_distro}
	cd ${_theme_distro}
	bsdtar -xf "$srcdir"/${_theme_distro}.tar
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

# example:
# https://github.com/archlinux/svntogit-packages/blob/packages/breeze-grub/trunk/PKGBUILD
package() {
	install -d "$pkgdir"/usr/share/grub/themes/
	cp -r ${_theme_distro} "$pkgdir"/usr/share/grub/themes
}
