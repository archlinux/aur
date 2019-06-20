# Maintainer: Justin Williams <justin@justinandyadi.com>
pkgname=workman-git
_gitname=Workman
pkgver=107.7d3dcaa
pkgrel=1
pkgdesc="The Workman Keyboard Layout created by OJ Bucao."
url="http://www.workmanlayout.com"
arch=('any')
license=('unknown')
depends=()
source=("git://github.com/workman-layout/Workman.git")
sha256sums=('SKIP')

pkgver() {
	cd $_gitname
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd ${srcdir}/${_gitname}/xorg/
  install -Dm644 workman  ${pkgdir}/usr/share/X11/xkb/symbols/workman
  install -Dm644 workman-p  ${pkgdir}/usr/share/X11/xkb/symbols/workman-p

  cd ${srcdir}/${_gitname}/linux_console/
  install -Dm644 workman.iso15.kmap ${pkgdir}/usr/share/kbd/keymaps/i386/workman/workman.map
  install -Dm644 workman-p.iso15.kmap ${pkgdir}/usr/share/kbd/keymaps/i386/workman/workman-p.map
}

