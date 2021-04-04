# Maintainer: Daniel Souza <danisztls@gmail.com>

_gitname=journal
_gitbranch=main
_gitauthor=lbcnz
pkgname=${_gitname}-git
pkgver=r52.4d9b0bb
pkgrel=1
pkgdesc="An agnostic approach to note management and personal organization."
arch=('any')
license=('GPL3')
url="https://github.com/${_gitauthor}/${_gitname}"
source=("git://github.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}")
sha512sums=('SKIP')
depends=('ripgrep' 'fzf' 'bat')
conflicts=("${_gitname}")
provides=("${_gitname}")

package() {
  cd "${_gitname}"
  
  install -Dm755 journal "${pkgdir}/usr/bin/journal"
  install -vDm 644 syntax/markdown.vim "${pkgdir}/usr/share/${_gitname}/markdown.vim"
  install -vDm 644 COPYING "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${_gitname}"
}
