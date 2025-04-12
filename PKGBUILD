# Maintainer: John Patrick <john.patrick@gmail.com>
pkgname=arcolinux-app-glade-git
_pkgname=arcolinux-app-glade
pkgver=r61.7e93aca
pkgrel=1
pkgdesc="ArcoLinux App Glade"
arch=('any')
url="https://github.com/arcolinux/arcolinux-app-glade"
license=('GPL3')
makedepends=('git')
depends=('python-distro' 'python-psutil' 'git' 'archiso' 'alacritty')
provides=("${pkgname}")
optdepends=('noto-fonts: for alignment of all the buttons and labels (optional)'
'hw-probe: information on hardware')
options=(!strip !emptydirs)
source=(git+${url})
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/arcolinux-app-glade"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	install -m755 -d "${pkgdir}/usr/"
	cp -r ${srcdir}/${_pkgname}/usr ${pkgdir}
}
