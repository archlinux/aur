# Maintainer: Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>
# Contributor: Mario Finelli <mario at finel dot li>

_commit=10bf0b27c5be81ee26c3a0d32e39b270f95329ce
pkgname=vim-puppet
pkgver=20240915
pkgrel=1
epoch=2
pkgdesc="Puppet language syntax highlighting for vim."
arch=('any')
url="https://github.com/rodjek/vim-puppet"
license=('Apache')
depends=('vim')
source=("${url}/archive/$_commit.zip")
sha256sums=('4bbeaf8e48f07949bd4e36f192950c0cadfcd72f60174061796c89d145aa1365')

package() {
    cd "vim-puppet-$_commit"
    _vimdir="${pkgdir}/usr/share/vim/vimfiles"

    install -dm755 "$_vimdir"/{after,ctags,compiler,ftdetect,ftplugin,indent,syntax}
    install -dm755 "$_vimdir"/autoload/puppet
    install -dm755 "$_vimdir"/after/{plugin,ftplugin}


    install -Dm644 after/plugin/gutentags.vim  "$_vimdir"/after/plugin/gutentags.vim
    install -Dm644 after/ftplugin/puppet.vim   "$_vimdir"/after/ftplugin/puppet.vim
    install -Dm644 autoload/puppet/format.vim  "$_vimdir"/autoload/puppet/format.vim
    install -Dm644 autoload/puppet/ctags.vim   "$_vimdir"/autoload/puppet/ctags.vim
    install -Dm644 autoload/puppet/align.vim   "$_vimdir"/autoload/puppet/align.vim
    install -Dm644 compiler/puppet-lint.vim    "$_vimdir"/compiler/puppet-lint.vim
    install -Dm644 ctags/puppet.ctags          "$_vimdir"/ctags/puppet.ctags
    install -Dm644 ctags/puppet_u.ctags        "$_vimdir"/ctags/puppet_u.ctags
    install -Dm644 ftdetect/puppet.vim         "$_vimdir"/ftdetect/puppet.vim
    install -Dm644 ftplugin/puppet.vim         "$_vimdir"/ftplugin/puppet.vim
    install -Dm644 ftplugin/puppet_tagbar.vim  "$_vimdir"/ftplugin/puppet_tagbar.vim
    install -Dm644 ftplugin/epuppet.vim        "$_vimdir"/ftplugin/embeddedpuppet.vim
    install -Dm644 indent/puppet.vim           "$_vimdir"/indent/puppet.vim
    install -Dm644 syntax/puppet.vim           "$_vimdir"/syntax/puppet.vim
    install -Dm644 syntax/epuppet.vim          "$_vimdir"/syntax/embeddedpuppet.vim
}
