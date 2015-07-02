# Maintainer: 3ED <krzysztof1987 _at_ gmail _dot_ com>

pkgname=vim-perl-completion
pkgver=2.4.2
_srcid=13656
pkgrel=2
pkgdesc='This perl omni completion support basic Moose syntax, variable name (array. hash .. ) completion, class method, object method completion, etc.'
arch=('i686' 'x86_64')
url='http://www.vim.org/scripts/script.php?script_id=2852'
license=('custom:vim')
depends=('vim')
install='vimdoc.install'
source=(perl-completion-${pkgver}.zip::http://www.vim.org/scripts/download_script.php?src_id=$_srcid
        makefile.patch)
sha256sums=('39cbfa8a836b605f10c4763e733f8686ed65f11b4a374284ee9235ae15872d7f'
            '48a67e36c5f61f79e3946045596a08eb4e0aca6eb267ef62e4b9c6fe3d685d20')

build() {
    cd "$srcdir"

    patch -Np0 -i "$srcdir/makefile.patch"

    make DESTDIR="$pkgdir" install
}
