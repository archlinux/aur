#Maintainer: Zachary Jordan <zacjor1 at gmail dot com>
#PKGBUILD based off https-everywhere-chrome-git from Yardena Cohen <yardenack at gmail dot com>

pkgsubn=Ban-Checker-for-Steam
pkgname=chromium-extension-ban-checker-for-steam-git
pkgver=r93.1472a44
pkgrel=1
pkgdesc="Chrome/Chromium extension for Ban-Checker-for-Steam - git/dev"
arch=('any')
url='https://github.com/ge-ku/Ban-Checker-for-Steam'
license=('custom')
makedepends=(git)
source=("git+https://github.com/ge-ku/Ban-Checker-for-Steam.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgsubn}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
	cd "${srcdir}/${pkgsubn}"
}
package() {
	 mkdir -p "${pkgdir}/usr/share/${pkgname}"
	 shopt -s dotglob
	 cp -dr --no-preserve=ownership "${srcdir}/${pkgsubn}/"/* "${pkgdir}/usr/share/${pkgname}"
}
