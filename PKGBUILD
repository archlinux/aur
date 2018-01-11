# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=plasma-video-wallpaper-git
pkgver=r13.65a7928
pkgrel=1
pkgdesc='Allows the use of video wallpaper and lock screen in KDE Plasma'
arch=('any')
url='https://github.com/halverneus/org.kde.video'
license=('GPL')
depends=('plasma-workspace')
makedepends=('git')
source=('git+https://github.com/halverneus/org.kde.video.git')
sha256sums=('SKIP')
_gitname='org.kde.video'

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	mkdir -p "${pkgdir}/usr/share/plasma/wallpapers"
	cp -rf "${srcdir}/${_gitname}" "${pkgdir}/usr/share/plasma/wallpapers/"
	rm -rf "${pkgdir}/usr/share/plasma/wallpapers/${_gitname}/.git"
}

# vim: set ts=2 sw=2 ft=sh noet:
