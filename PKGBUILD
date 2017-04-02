# Maintainer: yesuu zhang <yesuu79@qq.com>
# Contributor: Tomasz Żok <tomasz.zok [at] gmail.com>

pkgname=vim-go
pkgver=1.12
pkgrel=1
pkgdesc="Go development plugin for Vim"
arch=(any)
url=https://github.com/fatih/vim-go
license=('BSD')
groups=('vim-plugins')
depends=(vim)
optdepends=(
	'go-tools: developer tools'
	'gocode-daemon: autocompletion support'
)
source=("https://github.com/fatih/vim-go/archive/v${pkgver}.tar.gz")
sha256sums=('f2a2c20ae84accbe5a89d210dd4e86c732af5a859f21226a92ffb32c01f4071d')

package() {
	cd "${srcdir}/vim-go-${pkgver}/"
	install --directory "${pkgdir}/usr/share/vim/vimfiles/"
	for dir in assets/ autoload/ compiler/ doc/ ftdetect/ ftplugin/ gosnippets/ indent/ plugin/ scripts/ syntax/ templates/; do
		cp --recursive "${dir}" "${pkgdir}/usr/share/vim/vimfiles/"
	done
}
