# Maintainer: sballert <sballert@posteo.de>

_gituser="AndreaCrotti"
_gitrepo="yasnippet-snippets"

pkgname=emacs-yasnippet-snippets-git
pkgver=r661.ef6eae6
pkgrel=1
pkgdesc="a collection of yasnippet snippets for many languages"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-yasnippet')
makedepends=('git')
provides=('emacs-yasnippet-snippets')
conflicts=('emacs-yasnippet-snippets')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')
install=emacs-yasnippet-snippets.install

pkgver() {
  cd "$_gitrepo"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
  cd "$_gitrepo"
  install -d  "$pkgdir"/usr/share/emacs/snippets/"${_gitrepo}"
  cp -r snippets/* "$pkgdir"/usr/share/emacs/snippets/"${_gitrepo}"
}
