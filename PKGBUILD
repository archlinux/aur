# Maintainer: snogard <snogardb at gmail dot com>

pkgname=zinit
pkgver=3.16.0
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
sha256sums=('3c4780adda45cd746291b13c78649f149dbef3c0cdd1d9c769e9742f6008e684')
install=zinit.install

package() {
    mkdir -p "${pkgdir}/usr/share"
    cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/share/${pkgname}"
    make --directory="${pkgdir}/usr/share/${pkgname}"
}

