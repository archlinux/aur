# Maintainer: Daniel Souza <danisztls@gmail.com>

_gitname=fzfx
_gitbranch=main
_gitauthor=lbcnz
pkgname=${_gitname}-git
pkgver=r12.e59b56c
pkgrel=2
pkgdesc="A wrapper to fzf that does specialized fuzzy searches"
arch=('any')
license=('MIT')
url="https://github.com/${_gitauthor}/${_gitname}"
source=("git://github.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}")
sha512sums=('SKIP')
depends=('fzf' 'fd' 'ripgrep' 'bat')
optdepends=('evince: preview pdfs' 'mpv: preview videos' 'grc: colorize ps' 'tree: previews dir as tree' 'rga: fulltext search blobs')
conflicts=("${_gitname}")
provides=("${_gitname}")

package() {
  cd "${_gitname}"
  
  install -Dm755 fzfx "${pkgdir}/usr/bin/fzfx"
  install -vDm 644 LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${_gitname}"
}

