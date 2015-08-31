# Maintainer: olantwin <olantwin at gmail dot com>
# Contributor: Thomas Haider <t.haider@deprecate.de>
# Contributor: Raymond Wagenmaker <raymondwagenmaker at gmail dot com>
pkgname=vim-latex-box-git
pkgver=339.617027b
pkgrel=2
pkgdesc="Lightweight Toolbox for LaTeX"
arch=('any')
url="https://github.com/LaTeX-Box-Team/LaTeX-Box"
license=('GPL3')
groups=('vim-plugins')
depends=('vim')
optdepends=('texlive-core: background compilation support using latexmk')
conflicts=("vim-latex-box" "vim-latexsuite")
provides=("vim-latex-box")
makedepends=('git')
source=("git://github.com/LaTeX-Box-Team/LaTeX-Box.git")
install=vimdoc.install
sha256sums=('SKIP')

pkgver() {
  cd "LaTeX-Box"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  local installpath="${pkgdir}/usr/share/vim/vimfiles/"
  install -dm755 ${installpath}/{after,doc,ftplugin,indent,syntax,tools}
  cp -r LaTeX-Box/after ${installpath}
  cp -r LaTeX-Box/doc ${installpath}
  cp -r LaTeX-Box/ftplugin ${installpath}
  cp -r LaTeX-Box/indent ${installpath}
  cp -r LaTeX-Box/syntax ${installpath}
  cp -r LaTeX-Box/tools ${installpath}
}

# vim:set ts=2 sw=2 et:
