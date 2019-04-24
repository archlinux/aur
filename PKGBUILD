# Maintainer: Adam S Levy <adam@aslevy.com>
# Contributor: yesuu zhang <yesuu79@qq.com>
# Contributor: Tomasz Żok <tomasz.zok [at] gmail.com>
pkgname=vim-go
pkgver=1.20
pkgrel=1
pkgdesc="Go development plugin for Vim"
arch=(any)
url=https://github.com/fatih/vim-go
license=('BSD')
groups=('vim-plugins')
options=('!strip')
depends=(vim go)
optdepends=(
	'go-tools: developer tools'
	'gocode-daemon: autocompletion support'
)
source=("https://github.com/fatih/vim-go/archive/v${pkgver}.tar.gz")
sha256sums=('8d7b3db8a13f2f5769d4accb1b3c29c2a912f6f38dc513a81f31fc618e2c6d16')

package() {
	cd "${srcdir}/vim-go-${pkgver}/"
        local vimdir="$pkgdir/usr/share/vim/vimfiles"
        install --directory "$vimdir"
	for dir in assets/ autoload/ compiler/ doc/ ftdetect/ ftplugin/ gosnippets/ indent/ plugin/ rplugin/ scripts/ syntax/ templates/; do
		cp --recursive "${dir}" "$vimdir/"
	done

        install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
