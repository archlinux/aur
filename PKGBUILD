# Contributor: Aaron Griffin <aaron@archlinux.org>
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=vim-colorsamplerpack
pkgver=2012.10.28
pkgrel=6
_scriptid=18915
pkgdesc="Different colorschemes for vim"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=625"
license=('GPL2' 'GPL3' 'custom')
depends=('vim')
makedepends=('unzip')
groups=('vim-plugins')
source=(ColorSamplerPack.zip::"https://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        'LICENSE')
sha256sums=('2d0b07a36fa52728f45850933a35ab6172913262fb3aaa2cb32e597cf75859f3'
            '6d9e25d62ca66835eb24209c8e7ef973932165f65e96f615639027418ab6742d')

build() {
    cd ${srcdir}/colors
    # This already exist... we can't update it 8(
    rm torte.vim desert.vim molokai.vim jellybeans.vim
}

package() {
    cd ${srcdir}
    installpath="${pkgdir}/usr/share/vim/vimfiles"
    install -Dm 644 colors/* -t "${installpath}/colors"
    install -Dm 644 plugin/color_sample_pack.vim "${installpath}/plugin/themes.vim"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
