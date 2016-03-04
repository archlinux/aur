# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=papirus-wallpapers
pkgname=papirus-wallpapers-git
pkgver=20160304
pkgrel=1
pkgdesc="Papirus Wallpapers Suite"
arch=('any')
url="https://github.com/FadeMind/${_pkgname}"
license=('GPL2')
makedepends=('git')
optdepends=('papirus-git')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    cd ${srcdir}/${_pkgname}/
    rm README.md COPYING.GPL2
    find * -type f -exec install -Dm 644 '{}' "${pkgdir}/usr/share/wallpapers/{}" \;
} 
