# Maintainer: Yardena Cohen <yardenack at gmail dot com>

# check for new commits:
#   https://github.com/stylish-userstyles/stylish-chrome/commits/master

gitname=stylish-chrome
pkgname=${gitname}-git
pkgver=418.b4b972e
pkgrel=1
pkgdesc="User styles manager extension for Chrome and Chrome-like things"
arch=('any')
url="https://github.com/stylish-userstyles/${gitname}"
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
