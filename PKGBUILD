# Maintainer: revel <revelΘmuub·net>

pkgname=vim-endwise
pkgver=1.2
pkgrel=3
pkgdesc='A simple plugin that helps to end certain structures automatically.'
arch=('any')
#url='http://www.vim.org/scripts/script.php?script_id=2386'
url='https://github.com/tpope/${pkgname}'
license=('custom:vim')
depends=('vim')
groups=('vim-plugins')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tpope/${pkgname}/archive/v${pkgver}.tar.gz"
        'license.txt')
sha256sums=('365f0624fbe69beaedbdca5c6fae4e428e66b217bb59d3bba60d5aef0ada1b7b'
            '5f96d0bf57942212b6117ac4e6eb9b6ad704c1758511333dd5785cedf3281b8d')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    local installpath="${pkgdir}/usr/share/vim/vimfiles"

    install -D -m644 "plugin/endwise.vim" "${installpath}/plugin/endwise.vim"
    install -D -m644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
