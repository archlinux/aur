# Maintainer: snogard <snogardb at gmail dot com>

pkgname=zinit
pkgver=3.13.1
pkgrel=1
pkgdesc='A flexible and fast Zsh plugin manager.'
arch=('x86_64')
url='https://github.com/zdharma-continuum/zinit'
license=('MIT')
depends=('git' 'curl' 'zsh')
makedepend=('make')
provides=("zinit")
conflicts=("zinit-git")
source=("zinit-${pkgver}.zip"::"https://github.com/zdharma-continuum/zinit/archive/refs/tags/v${pkgver}.zip")
sha256sums=('1890ac5b83c6b1ed53368f4485b7587f69851c422426df01dec70a396b2fc526')
install=zinit.install

package() {
    mkdir -p "${pkgdir}/usr/share"
    cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/share/${pkgname}"
    make --directory="${pkgdir}/usr/share/${pkgname}"
}

