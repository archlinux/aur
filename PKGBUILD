# Maintainer: zjuyk <ownbyzjuyk at gmail dot com>
pkgname=kwin-script-grid-tiling-git
_gitname=Grid-Tiling-Kwin
pkgver=r313.8710583
pkgrel=1
pkgdesc="A kwin script that automatically tiles windows"
arch=('any')
url="https://github.com/lingtjien/Grid-Tiling-Kwin"
license=('GPL3')
depends=('kwin')
makedepends=('kpackage')
provides=('kwin-script-grid-tiling')
conflicts=('kwin-script-grid-tiling')
source=("$_gitname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_gitname}"
	kpackagetool5 --type Kwin/Script --install . -p "${pkgdir}/usr/share/kwin/scripts/"
	install -Dm644 metadata.desktop "${pkgdir}/usr/share/kservices5/${_gitname}.desktop"
}
