# Maintainer: Kars Wang <jaklsy+aur at gmail dot com>

_gitname=Ysabeau
pkgbase=ysabeau-git
pkgname=("otf-${pkgbase}" "ttf-${pkgbase}")
pkgver=0.003.r107.gc620c84
pkgrel=1
pkgdesc="The essence of Garamond in an open-source sans-serif typeface."
url='https://github.com/CatharsisFonts/Ysabeau'
arch=('any')
license=('OFL-1.1 License')
makedepends=('git')
provides=("otf-ysabeau=${pkgver}" "ttf-ysabeau=${pkgver}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_otf-ysabeau-git() {
    cd "${_gitname}"
    install -Dm644 fonts/otf/*.otf -t "$pkgdir"/usr/share/fonts/OTF
}

package_ttf-ysabeau-git() {
    cd "${_gitname}"
    install -Dm644 fonts/ttf/*.ttf -t "$pkgdir"/usr/share/fonts/TTF
}
