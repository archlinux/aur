# Maintainer: Shengyu Zhang <la@archlinuxcn.org>

_pkgname=gtk-vim-syntax
pkgname=vim-${_pkgname}
pkgver=20130716
pkgrel=1
pkgdesc='A collection of C extension syntax files for xlib, glib, gtk2/3 and related libraries.'
arch=('any')
url='https://www.vim.org/scripts/script.php?script_id=1000'
license=('custom')
depends=('vim')
groups=('vim-plugins')
source=("${_pkgname}.tar.gz::https://www.vim.org/scripts/download_script.php?src_id=20534")
sha256sums=('0ed92c98554083d05603f9b57b381e7c260e4b288ccedc17890304c8ad0ae1f6')

package() {
    cd "${srcdir}/${_pkgname}"
    for f in *.vim; do
        install -Dm644 "${f}" "${pkgdir}/usr/share/vim/vimfiles/after/syntax/${f}"
    done
    install -Dm644 "c.vim.example" "${pkgdir}/usr/share/vim/vimfiles/after/syntax/c.vim"
}

