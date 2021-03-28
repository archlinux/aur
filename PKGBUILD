# Maintainer: Jacob Koziej <jacobkoziej@gmail.com>
_pkgname=mkinitcpio-msg
pkgname=${_pkgname}-git
pkgver=r10.f7e1db9
pkgrel=1
pkgdesc='Display a message in early boot'
arch=('any')
url='https://git.jacobkoziej.xyz/mkinitcpio-msg/'
license=('GPL3')
source=("git+${url}?signed")
validpgpkeys=('1BF98D10E0D00B41572358364C133A84E6469228')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
