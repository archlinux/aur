# Maintainer: Mario Finelli <mario at finel dot li>

_commit=f36cf6936bf8667d6b86f84e1b81673e80e1f704
pkgname=vim-puppet
pkgver=20180325
pkgrel=1
epoch=2
pkgdesc="Puppet language syntax highlighting for vim."
arch=('any')
url="https://github.com/puppetlabs/puppet-syntax-vim"
license=('Apache')
depends=('vim')
source=("https://github.com/puppetlabs/puppet-syntax-vim/archive/$_commit.zip")
sha256sums=('16d2a326a70f91c2b6008fb0f0f87708eb5be6eca87167f51a4232610f457513')

package() {
    cd "puppet-syntax-vim-$_commit"
    _vimdir="${pkgdir}/usr/share/vim/vimfiles"

    install -dm755 "$_vimdir"/{ftdetect,ftplugin,indent,syntax}

    install -Dm644 ftdetect/puppet.vim "$_vimdir"/ftdetect/puppet.vim
    install -Dm644 ftplugin/puppet.vim "$_vimdir"/ftplugin/puppet.vim
    install -Dm644 indent/puppet.vim "$_vimdir"/indent/puppet.vim
    install -Dm644 syntax/puppet.vim "$_vimdir"/syntax/puppet.vim
}
