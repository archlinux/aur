# Maintainer: yesuu zhang <yesuu79@qq.com>
# Contributor: Tomasz Żok <tomasz.zok [at] gmail.com>

pkgname=vim-go
pkgver=1.10
pkgrel=1
pkgdesc="Go development plugin for Vim"
arch=(any)
url=https://github.com/fatih/vim-go
license=('BSD')
depends=(vim)
optdepends=(
	'go-tools: developer tools'
	'gocode-daemon: autocompletion support'
)
source=("https://github.com/fatih/vim-go/archive/v${pkgver}.tar.gz")
md5sums=('c4eaaedd8f2719428a97ace385697efe')

package() {
	cd "${srcdir}/vim-go-${pkgver}/"
	install --directory "${pkgdir}/usr/share/vim/vimfiles/"
	for dir in assets/ autoload/ compiler/ doc/ ftdetect/ ftplugin/ gosnippets/ indent/ plugin/ scripts/ syntax/ t/ templates/; do
		cp --recursive "${dir}" "${pkgdir}/usr/share/vim/vimfiles/"
	done
}
