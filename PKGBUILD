# Maintainer: John Patrick <john.patrick@gmail.com>
pkgname=archlinux-tweak-tool-git
_pkgname=archlinux-tweak-tool
pkgver=r787.9a508c5
pkgrel=1
pkgdesc="Arch Linux Tweak Tool or ATT"
arch=('x86_64')
url="https://github.com/arcolinux/archlinux-tweak-tool"
license=('GPL3')
depends=('polkit-gnome' 'lsb-release' 'neofetch' 'python-distro' 'python-numpy' 'python-psutil')
optdepends=('reflector' 'alacritty' 'alacritty-themes' 'arcolinux-mirrorlist-git' 'arcolinux-keyring' 'chaotic-mirrorlist' 'chaotic-keyring' 'endeavouros-keyring' 'endeavouros-mirrorlist')
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
