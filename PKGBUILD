# Maintainer: snogard <snogardb at gmail dot com>

pkgname=zinit
pkgver=3.14.0
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
sha256sums=('1d2242677d01413a6b23448bbef9aa7789ca832915ac9b1960144b51b3583a2e')
install=zinit.install

package() {
    mkdir -p "${pkgdir}/usr/share"
    cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/share/${pkgname}"
    make --directory="${pkgdir}/usr/share/${pkgname}"
}

