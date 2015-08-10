# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=vim-puppet
pkgver=4.2.1
pkgrel=1
epoch=1
pkgdesc="Puppet language syntax highlighting for vim."
arch=('any')
url="https://github.com/puppetlabs/puppet/tree/master/ext/vim/"
license=('Apache')
depends=('vim')
source=("https://github.com/puppetlabs/puppet/archive/${pkgver}.tar.gz")
sha256sums=('e3f076b307e106e698f7f77c05edf0eb74b0ce7fd8094b9107e81f929ace8df2')

package() {
    cd "${srcdir}/puppet-${pkgver}/ext/vim"
    _vimdir="${pkgdir}/usr/share/vim/vimfiles"

    install -dm755 "$_vimdir"/{ftdetect,ftplugin,indent,syntax}

    install -Dm644 ftdetect/puppet.vim "$_vimdir"/ftdetect/puppet.vim
    install -Dm644 ftplugin/puppet.vim "$_vimdir"/ftplugin/puppet.vim
    install -Dm644 indent/puppet.vim "$_vimdir"/indent/puppet.vim
    install -Dm644 syntax/puppet.vim "$_vimdir"/indent/puppet.vim
}
