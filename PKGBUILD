# Maintainer: Yardena Cohen <yardenack at gmail dot com>

# check for new commits:
#   https://github.com/Lyrrad/NewsBlurBackgroundTab/commits/master

gitname=newsblurbackgroundtab
pkgname=${gitname}-git
pkgver=32.bf8d36e
pkgrel=1
pkgdesc="Chrome/Chromium extension to open background tabs from newsblur"
arch=('any')
url="https://github.com/Lyrrad/${gitname}"
license=('GPL')
makedepends=(git)
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${gitname}"
	local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	printf "%s" "${ver//-/.}"
}
package() {
	 mkdir -p "${pkgdir}/usr/share/${pkgname}"
	 shopt -u dotglob
	 cp -dr --no-preserve=ownership "${srcdir}/${gitname}"/* "${pkgdir}/usr/share/${pkgname}/"
}
