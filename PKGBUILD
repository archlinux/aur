# Maintainer: Adam S Levy <adam@aslevy.com>
# Contributor: yesuu zhang <yesuu79@qq.com>
# Contributor: Tomasz Żok <tomasz.zok [at] gmail.com>
pkgname=vim-go
pkgver=1.17
pkgrel=1
pkgdesc="Go development plugin for Vim"
arch=(any)
url=https://github.com/fatih/vim-go
license=('BSD')
groups=('vim-plugins')
options=('!strip')
depends=(vim)
optdepends=(
	'go-tools: developer tools'
	'gocode-daemon: autocompletion support'
)
source=("https://github.com/fatih/vim-go/archive/v${pkgver}.tar.gz")
sha256sums=('dd70a6542c6679048930671f39c57e4e090eb4058045e5f1f05f55164200a8df')

package() {
	cd "${srcdir}/vim-go-${pkgver}/"
        local vimdir="$pkgdir/usr/share/vim/vimfiles"
        install --directory "$vimdir"
	for dir in assets/ autoload/ compiler/ doc/ ftdetect/ ftplugin/ gosnippets/ indent/ plugin/ scripts/ syntax/ templates/; do
		cp --recursive "${dir}" "$vimdir/"
	done
}
