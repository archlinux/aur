# Maintainer: yesuu zhang <yesuu79@qq.com>
# Contributor: exul <exul [at] v-net [dot] ch>

pkgname=vim-go-git
pkgver=20150710
pkgrel=1
pkgdesc='Go development plugin for Vim'
arch=('any')
url='https://github.com/fatih/vim-go'
license=(unknown)
conflicts=('vim-go' 'vim-gocode' 'gocode-git')
depends=('go' 'vim')
makedepends=('git')
source=('git+https://github.com/fatih/vim-go.git')
md5sums=(SKIP)

package() {
	cd "${srcdir}/vim-go/"
	install --directory "${pkgdir}/usr/share/vim/vimfiles/"
	for dir in autoload/ compiler/ doc/ ftdetect/ ftplugin/ gosnippets/ indent/ plugin/ scripts/ syntax/; do
		cp --recursive "${dir}" "${pkgdir}/usr/share/vim/vimfiles/"
	done
}
