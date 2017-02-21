# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=vim-puppet
pkgver=4.9.2
pkgrel=1
epoch=1
pkgdesc="Puppet language syntax highlighting for vim."
arch=('any')
url="https://github.com/puppetlabs/puppet/tree/master/ext/vim/"
license=('Apache')
depends=('vim')
conflicts=('puppet')
source=("https://github.com/puppetlabs/puppet/archive/${pkgver}.tar.gz")
sha256sums=('ba23154d7f04242f7c7487b36b583822ce3210cd21b5e933f3c9788c3a499427')

package() {
    cd "${srcdir}/puppet-${pkgver}/ext/vim"
    _vimdir="${pkgdir}/usr/share/vim/vimfiles"

    install -dm755 "$_vimdir"/{ftdetect,ftplugin,indent,syntax}

    install -Dm644 ftdetect/puppet.vim "$_vimdir"/ftdetect/puppet.vim
    install -Dm644 ftplugin/puppet.vim "$_vimdir"/ftplugin/puppet.vim
    install -Dm644 indent/puppet.vim "$_vimdir"/indent/puppet.vim
    install -Dm644 syntax/puppet.vim "$_vimdir"/syntax/puppet.vim
}
