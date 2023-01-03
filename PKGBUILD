# Maintainer: Evgeniy Dobromliskiy <voltasar at gmail dot com>
# Contributor: Evgeniy Dobromliskiy <voltasar at gmail dot com>

pkgname='se98-icon-theme-git'
pkgver=0.2.15
pkgrel=1
pkgdesc="Windows 98 Second Edition (Win98SE) inspired icon theme"
arch=(any)
url="https://github.com/nestoris/Win98SE"
license=('GPLv2')
makedepends=(git)
optdepends=('gawk: for Win2K/Win98 toggling awk scripts'
			'nawk: for Win2K/Win98 toggling awk scripts'
			'mawk: for Win2K/Win98 toggling awk scripts'
			'chicago95-icon-theme-git: for some missing icons in SE98 theme')
source=("git+https://github.com/nestoris/Win98SE.git")
sha256sums=(SKIP)

pkgver() {
    cd Win98SE
    git describe --long --tags | awk 'gsub(/(^v[^0-9]*|-.*)/,"")'
}

package_se98-icon-theme-git() {
    pkgdesc="Windows 98 Second Edition inspired icon theme"
    provides=(se98-icon-theme)
    conflicts=(se98-icon-theme)

    cd Win98SE
    install -d "${pkgdir}/usr/share/icons/"
    cp -r "SE98/" "${pkgdir}/usr/share/icons/SE98/"
}
