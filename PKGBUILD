# Maintainer: John Patrick <john.patrick@gmail.com>
pkgname=archlinux-tweak-tool-git
_pkgname=archlinux-tweak-tool
pkgver=r1190.bcba8d7
pkgrel=1
pkgdesc="Arch Linux Tweak Tool or ATT"
arch=('x86_64')
url="https://github.com/erikdubois/archlinux-tweak-tool"
license=('GPL3')
depends=('python-gobject' 'polkit-gnome' 'lsb-release' 'python-distro' 'python-numpy' 'python-psutil')
optdepends=('reflector' 'alacritty' 'chaotic-mirrorlist' 'chaotic-keyring')
makedepends=('git')
options=(!strip !emptydirs)
replaces=(arcolinux-tweak-tool-git)
conflicts=('arcolinux-tweak-tool-git' 'arcolinux-tweak-tool-dev-git' 'archlinux-tweak-tool-dev-git')
source=(git+${url})
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/archlinux-tweak-tool"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	install -m755 -d "${pkgdir}/usr/"
	cp -r ${srcdir}/${_pkgname}/usr ${pkgdir}
}
