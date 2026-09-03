# Maintainer: snogard <snogardb at gmail dot com>

pkgname=zinit
pkgver=3.17.0
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
sha256sums=('554a84c3298002b8a486a8e50b603027229659a2ef80bc11ff745c1ed444490b')
install=zinit.install

package() {
    mkdir -p "${pkgdir}/usr/share"
    cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/share/${pkgname}"
    make --directory="${pkgdir}/usr/share/${pkgname}"
}

