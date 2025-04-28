# Maintainer:
# Contributor: Colin Arnott <colin@urandom.co.uk>
# Contributor: Adam S Levy <adam@aslevy.com>
# Contributor: yesuu zhang <yesuu79@qq.com>
# Contributor: Tomasz Żok <tomasz.zok [at] gmail.com>

pkgname=vim-go
pkgver=1.29
pkgrel=1
pkgdesc="Go development plugin for Vim"
arch=(any)
url="https://github.com/fatih/vim-go"
license=('BSD-3-Clause')
depends=('vim-plugin-runtime' 'go')
optdepends=(
    'asmfmt'
    'delve: for dlv command'
    'errcheck'
    'godef'
    'go-impl: for impl command'
    'golangci-lint'
    'gomodifytags'
    'go-motion: for motion command'
    'gopls'
    'gotags'
    'go-tools: for goimports command'
    'iferr'
    'reftools: for fillstruct command'
    'revive'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('0dc89d660c5987b685e0314b79064f888a8b423c4cdd20fef86538d75bc55f64dbbee7e26751050018f7cd92877c5a6a6b9eb14c5e0b9e4c408b565decc1c13e')

package() {
    cd $pkgname-$pkgver
    local _vimdir="$pkgdir/usr/share/vim/vimfiles"
    install -dm755 "$_vimdir"
    cp -r assets autoload compiler doc ftdetect ftplugin gosnippets indent plugin rplugin scripts syntax templates "$_vimdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=4 sw=4 et:
