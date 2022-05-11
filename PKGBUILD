# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Contributor: Adam S Levy <adam@aslevy.com>
# Contributor: yesuu zhang <yesuu79@qq.com>
# Contributor: Tomasz Żok <tomasz.zok [at] gmail.com>
pkgname=vim-go
pkgver=1.26
pkgrel=1
pkgdesc="Go development plugin for Vim"
arch=(any)
url=https://github.com/fatih/vim-go
license=('BSD')
groups=('vim-plugins')
options=('!strip')
depends=('vim' 'go' 'asmfmt' 'delve' 'errcheck' 'reftools-git' 'godef' 'go-tools' 'golint-git' 'revive' 'gopls' 'golangci-lint' 'staticcheck' 'gomodifytags' 'gotags' 'go-impl' 'go-honnef-tools' 'go-motion' 'iferr-git')
source=("https://github.com/fatih/vim-go/archive/v${pkgver}.tar.gz")
sha512sums=('30722557c2c66e3601a001b490bf4949bf9949a2b41db838f0fa3fba91abb30469d3726cee293afdd1afd385871d62db09e9e9bf2acf48d947b469a5a19888ac')

package() {
	cd "${srcdir}/vim-go-${pkgver}/"
        local vimdir="$pkgdir/usr/share/vim/vimfiles"
        install --directory "$vimdir"
	for dir in assets/ autoload/ compiler/ doc/ ftdetect/ ftplugin/ gosnippets/ indent/ plugin/ rplugin/ scripts/ syntax/ templates/; do
		cp --recursive "${dir}" "$vimdir/"
	done

        install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
