# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Contributor: Adam S Levy <adam@aslevy.com>
# Contributor: yesuu zhang <yesuu79@qq.com>
# Contributor: Tomasz Żok <tomasz.zok [at] gmail.com>
pkgname=vim-go
pkgver=1.25
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
	'delve: debugger'
)
source=("https://github.com/fatih/vim-go/archive/v${pkgver}.tar.gz")
sha512sums=('42263050893c9ab939346d5572b67e86e3ef3095ab0164ce7932bcf8702703bddffe621e6a658fd772af0e20a9ed06906d9f6b7db4a1cbfb1095e948d5883f56')

package() {
	cd "${srcdir}/vim-go-${pkgver}/"
        local vimdir="$pkgdir/usr/share/vim/vimfiles"
        install --directory "$vimdir"
	for dir in assets/ autoload/ compiler/ doc/ ftdetect/ ftplugin/ gosnippets/ indent/ plugin/ rplugin/ scripts/ syntax/ templates/; do
		cp --recursive "${dir}" "$vimdir/"
	done

        install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
