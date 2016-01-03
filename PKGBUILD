# Maintainer: yesuu zhang <yesuu79@qq.com>
# Contributor: Tomasz Żok <tomasz.zok [at] gmail.com>

pkgname=vim-go
pkgver=1.3
pkgrel=1
pkgdesc="Go development plugin for Vim"
arch=(any)
url=https://github.com/fatih/vim-go
license=('BSD')
depends=(vim)
optdepends=('gocode-daemon: autocompletion support') 
source=("https://github.com/fatih/vim-go/archive/v${pkgver}.tar.gz")
md5sums=('9af4c38491a62f953d090bfdd5b1d9f1')

package() {
	cd "${srcdir}/vim-go-${pkgver}/"
	install --directory "${pkgdir}/usr/share/vim/vimfiles/"
	for dir in autoload/ compiler/ doc/ ftdetect/ ftplugin/ gosnippets/ indent/ plugin/ scripts/ syntax/; do
		cp --recursive "${dir}" "${pkgdir}/usr/share/vim/vimfiles/"
	done
}
