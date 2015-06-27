# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: M Rawash <mrawash@gmail.com>
# Contributor: János Illés <ijanos@gmail.com>
_name=vim-fugitive
pkgname="${_name}-git"
pkgver=1.2.245.gc99f0ff
pkgrel=1
pkgdesc='A git wrapper so awesome, it should be illegal.'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=2975'
license=('custom:vim')
groups=('vim-plugins')
depends=('vim' 'git')
conflicts=('vim-fugitive')
provides=('vim-fugitive')
makedepends=('git')
install='vimdoc.install'
source=("${_name}::git://github.com/tpope/${_name}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  echo "$(git describe --always|cut -d 'v' -f2|sed -e 's|-|.|g' )"
}

package() {
  cd "${srcdir}/${_name}"

  installpath="${pkgdir}/usr/share/vim/vimfiles"

  install -Dm644 doc/fugitive.txt "$installpath/doc/fugitive.txt"
  install -Dm644 plugin/fugitive.vim "$installpath/plugin/fugitive.vim"
}

# vim:set ts=2 sw=2 et:
