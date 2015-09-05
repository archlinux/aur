# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# PKGBUILD file for link-vim-to-vi.
# Contributor: Patrick Goetz <pgoetz@linuxcs.com>

pkgname='vi-vim-symlink'
pkgver='1'
pkgrel='2'
pkgdesc='Replace vi with vim'
arch=('any')
url='http://www.vim.org'
license=('CDDL')
depends=('vim')
provides=('vi')
conflicts=('vi')

package() {
  set -u
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/man/man1"
  local _file
  for _file in 'edit' 'ex' 'vedit' 'vi' 'view'; do
    ln -sf 'vim' "${pkgdir}/usr/bin/${_file}"
    ln -sf 'vim.1.gz' "${pkgdir}/usr/share/man/man1/${_file}.1.gz"
  done
  set +u
}

