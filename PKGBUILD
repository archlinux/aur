# Maintainer: envolution
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=vim-sensible
pkgver=2.0
pkgrel=1
pkgdesc="vim defaults everyone can agree on"
arch=('any')
url="https://github.com/tpope/${pkgname}"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1cfb72afe7c291f4b44e1b703cc52b0ac62a6a5aa82238fc3599f360505730f2')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -dm755 "${pkgdir}/usr/share/vim/vimfiles"
    find * -maxdepth 0 -type d -exec cp -rt "${pkgdir}/usr/share/vim/vimfiles" '{}' \+
}
