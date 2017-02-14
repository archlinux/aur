# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=solus-icon-theme-git
_gitname=solus-icon-theme
pkgver=68.c3aa11b
pkgrel=1
pkgdesc='Solus Icon Theme.'
arch=(any)
url=https://github.com/solus-project/solus-icon-theme
license=('GPL3')
depends=('gtk-update-icon-cache')
makedepends=('git')
source=("git://github.com/solus-project/${_gitname}.git")
md5sums=('SKIP')
conflicts=('solus-icon-theme')

pkgver() {
	cd "${srcdir}/${_gitname}"	
  	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  	cd "${srcdir}/${_gitname}"
  	install -d 655 "${pkgdir}/usr/share/icons/"
  	cp -r ./Solus "${pkgdir}/usr/share/icons/Solus"
}