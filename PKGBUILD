# Maintainer: snogard <snogardb at gmail dot com>

pkgname=zinit
pkgver=3.15.3
pkgrel=1
pkgdesc='A flexible and fast Zsh plugin manager.'
arch=('any')
url='https://github.com/zdharma-continuum/zinit'
license=('MIT')
depends=('git' 'curl' 'zsh')
makedepend=('make')
provides=("zinit")
conflicts=("zinit-git")
source=("zinit-${pkgver}.zip"::"https://github.com/zdharma-continuum/zinit/archive/refs/tags/v${pkgver}.zip")
sha256sums=('1bcaca8cafbc4fb4841cf8b1bc4b85484e2dd5eb9ae59e00d7de7c23d1efc4c2')
install=zinit.install

package() {
    mkdir -p "${pkgdir}/usr/share"
    cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/share/${pkgname}"
    make --directory="${pkgdir}/usr/share/${pkgname}"
}

