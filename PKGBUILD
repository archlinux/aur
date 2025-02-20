# Maintainer:
# Contributor: Colin Arnott <colin@urandom.co.uk>
# Contributor: Adam S Levy <adam@aslevy.com>
# Contributor: yesuu zhang <yesuu79@qq.com>
# Contributor: Tomasz Żok <tomasz.zok [at] gmail.com>

pkgname=vim-go
pkgver=1.28
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
sha512sums=('ebd4fbeabb3ebea0c63c1b70dd8bbf7de6ba20b33e40159bcc88d8d52a10975ab4b0ad849a4d8dd1edc2d073ca7c7ae17843cd70d415f159f07d2a212005825b')

package() {
    cd $pkgname-$pkgver
    local _vimdir="$pkgdir/usr/share/vim/vimfiles"
    install -dm755 "$_vimdir"
    cp -r assets autoload compiler doc ftdetect ftplugin gosnippets indent plugin rplugin scripts syntax templates "$_vimdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=4 sw=4 et:
