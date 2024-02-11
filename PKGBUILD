# Maintainer: revel <revelΘmuub·net>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-colorsupport
pkgver=1.0.5
#_scriptid=20938
pkgrel=4
pkgdesc='Use colorschemes written for gvim in color terminals'
arch=('any')
#url='http://www.vim.org/scripts/script.php?script_id=2682'
url='https://github.com/vim-scripts/colorsupport.vim'
license=('custom:vim')
depends=('vim')
groups=('vim-plugins')
#source=("colorsupport.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}")
source=("https://github.com/vim-scripts/colorsupport.vim/archive/refs/tags/${pkgver}.tar.gz"
        'license.txt')
sha256sums=('cff6c34da7450b1469d6e871f17cb5be411dc41c3ae571f172e5aa8252ea07a3'
            '5f96d0bf57942212b6117ac4e6eb9b6ad704c1758511333dd5785cedf3281b8d')

package() {
    cd "colorsupport.vim-${pkgver}"

    local installpath="${pkgdir}/usr/share/vim/vimfiles"

    install -D -m644 "plugin/colorsupport.vim" "${installpath}/plugin/colorsupport.vim"
    install -D -m644 "../license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
