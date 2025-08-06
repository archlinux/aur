# Maintainer: Yunhui Fu <yhfudev@gmail.com>
# Contributor: Tianjiao Yin <ytj000@gmail.com>

pkgname=vim-exvim
pkgver=0.5.0
pkgrel=1
pkgdesc="exVim make the vim as an IDE like environment all in vimscript. "
arch=("any")
url="http://exvim.github.io/docs/"
license=('unknown')
groups=('vim-plugins')
depends=(
	'vim-plugin-runtime'
	'ctags'
	'gawk'
	'python'
	'make'
	'cscope'
	'graphviz'
	'source-highlight'
	'idutils'
	)

conflicts=(

#####################################
# Need not to have any modification #
#####################################

	'vim-a' 
	'vim-cmdline-complete'
	'vim-enhcomm'
	'vim-nerdtree'
	'vim-omnicppcomplete'
	'vim-genutils'
	'vim-surround'
	'vim-visincr'
	'vim-vimwiki'

#################################
# Must be modified to fit exVim #
#################################

	'vim-echofunc'
	'vim-cref'
	'vim-minibufexpl'
	'vim-lookupfile'
	'vim-showmarks'
	'vim-taglist'
	'vim-visual_studio'
	)

provides=(${conflicts})
install=vimdoc.install
source=(
    #"${pkgname}-${pkgver}.tar.gz::https://github.com/exvim/main/releases/download/v${pkgver}/exvim-v${pkgver}.tar.gz"
    "https://github.com/exvim/main/releases/download/v${pkgver}/exvim-v${pkgver}.tar.gz"
    )

build() {
    echo "replace your ~/.vimrc:"
    echo "let g:exvim_custom_path='/usr/share/exvim/'"
    echo "source /usr/share/exvim/.vimrc"
}

package() {
    cd ${srcdir}
    rm -f "exvim-v${pkgver}.tar.gz"
    mkdir -p ${pkgdir}/usr/share/exvim
    cp -r * .vimrc .vimrc.mini .vimrc.plugins   ${pkgdir}/usr/share/exvim
}

md5sums=('9590008f87bdd2f8e6669e279cb82c6e')
