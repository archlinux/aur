# Maintainer: Michael Tindal <nihilistzsche@gmail.com>
pkgname=plymouth-i_use_arch_btw-git
_pkgname=plymouth-i_use_arch_btw
pkgdesc='Plymouth theme "i_use_arch_btw"'
arch=('any')
url='https://github.com/SimoriccITA/plymouth-i_use_arch_btw'
depends=('plymouth')
license=('GPL3')
provides=("${_pkgname}-git")
conflicts=("${_pkgname}-git")
source=("$_pkgname::git+${url}.git")
pkgver=r5.5762e93
pkgrel=1
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
	mkdir -p "${pkgdir}/usr/share/plymouth/themes"
	cp -r i_use_arch_btw "${pkgdir}/usr/share/plymouth/themes" 
}
