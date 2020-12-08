# Maintainer: Mario Finelli <mario at finel dot li>

_commit=fc6e9efef797c505b2e67631ad2517d7d6e8f00d
pkgname=vim-puppet
pkgver=20190916
pkgrel=1
epoch=2
pkgdesc="Puppet language syntax highlighting for vim."
arch=('any')
url="https://github.com/rodjek/vim-puppet"
license=('Apache')
depends=('vim')
source=("${url}/archive/$_commit.zip")
sha256sums=('d30822a4996713a6c9911e773c4b652bd1e5a0d5371f9b56f932e7d7f4a029d3')

package() {
    cd "vim-puppet-$_commit"
    _vimdir="${pkgdir}/usr/share/vim/vimfiles"

    install -dm755 "$_vimdir"/{after,ctags,ftdetect,ftplugin,indent,syntax}
    install -dm755 "$_vimdir"/autoload/puppet
    install -dm755 "$_vimdir"/after/{plugin,ftplugin}


    install -Dm644 ftdetect/puppet.vim         "$_vimdir"/ftdetect/puppet.vim
    install -Dm644 ftplugin/puppet.vim         "$_vimdir"/ftplugin/puppet.vim
    install -Dm644 ftplugin/puppet_tagbar.vim  "$_vimdir"/ftplugin/puppet_tagbar.vim
    install -Dm644 ftplugin/embeddedpuppet.vim "$_vimdir"/ftplugin/embeddedpuppet.vim
    install -Dm644 indent/puppet.vim           "$_vimdir"/indent/puppet.vim
    install -Dm644 syntax/puppet.vim           "$_vimdir"/syntax/puppet.vim
    install -Dm644 syntax/embeddedpuppet.vim   "$_vimdir"/syntax/embeddedpuppet.vim
    install -Dm644 autoload/puppet/format.vim  "$_vimdir"/autoload/puppet/format.vim
    install -Dm644 autoload/puppet/ctags.vim   "$_vimdir"/autoload/puppet/ctags.vim
    install -Dm644 autoload/puppet/align.vim   "$_vimdir"/autoload/puppet/align.vim
    install -Dm644 after/plugin/gutentags.vim  "$_vimdir"/after/plugin/gutentags.vim
    install -Dm644 after/ftplugin/puppet.vim   "$_vimdir"/after/ftplugin/puppet.vim
}
