# Maintainer: zjuyk <ownbyzjuyk at gmail dot com>
pkgname=kwin-script-grid-tiling-git
_gitname=Grid-Tiling-Kwin
pkgver=r330.9a290de
pkgrel=1
pkgdesc="A kwin script that automatically tiles windows"
arch=('any')
url="https://github.com/lingtjien/Grid-Tiling-Kwin"
license=('GPL3')
depends=('kwin')
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
	# kpackagetool5 --type Kwin/Script --install . -p "${pkgdir}/usr/share/kwin/scripts/"
	mkdir -p "${pkgdir}/usr/share/kwin/scripts/grid-tiling"
	cp -r ./contents "${pkgdir}/usr/share/kwin/scripts/grid-tiling/"
	install -Dm644 metadata.json "${pkgdir}/usr/share/scripts/grid-tiling/metadata.json"
}
