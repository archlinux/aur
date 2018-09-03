# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=vim-eunuch
pkgver=1.2
pkgrel=1
pkgdesc="Vim sugar for the UNIX shell commands that need it the most, by tpope"
arch=('any')
url="https://github.com/tpope/${pkgname}"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c226391abb0753c2cadb04667466d33a6433ccd85fd3000bf76422d70980f806')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -dm755 "${pkgdir}/usr/share/vim/vimfiles"
    find * -maxdepth 0 -type d -exec cp -rt "${pkgdir}/usr/share/vim/vimfiles" '{}' \+
}
