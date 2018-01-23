# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=vim-sensible
pkgver=1.2
pkgrel=1
pkgdesc="vim defaults everyone can agree on"
arch=('any')
url="https://github.com/tpope/${pkgname}"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3b83f8f6445fff628cab4a5571984eb853fe9c3d53297ff3e8a647d1576940f3')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -dm755 "${pkgdir}/usr/share/vim/vimfiles"
    find * -maxdepth 0 -type d -exec cp -rt "${pkgdir}/usr/share/vim/vimfiles" '{}' \+
}
