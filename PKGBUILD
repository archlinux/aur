# Maintainer: snogard <snogardb at gmail dot com>

pkgname=zinit
pkgver=3.15.0
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
sha256sums=('858b4df7ab674b1d2eef2c1654069aa87a2ac35c7062de4a4815e4c8fd6f433c')
install=zinit.install

package() {
    mkdir -p "${pkgdir}/usr/share"
    cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/share/${pkgname}"
    make --directory="${pkgdir}/usr/share/${pkgname}"
}

