# Maintainer: Alad Wenter <alad@archlinux.org>
# Contributor:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Patrick Goetz <pgoetz@linuxcs.com>

pkgname=vi-vim-symlink
pkgver=1
pkgrel=2
pkgdesc='Replace vi with vim'
arch=('any')
url='http://www.vim.org'
license=('CDDL')
depends=('vim')
provides=('vi')
conflicts=('vi')

package() {
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/man/man1"

    local _file
    for _file in edit ex vedit vi view; do
        ln -s vim "$pkgdir/usr/bin/$_file"
        ln -s vim.1.gz "$pkgdir/usr/share/man/man1/$_file".1.gz
    done
}

