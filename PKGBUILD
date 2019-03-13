# Maintainer: Jon Eyolfson <jon@eyl.io>
# Contributor: Chirantan EKbote <chirantan.ekbote at gmail.com>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=emacs-helm-ls-git
pkgver=1.9.1
pkgrel=1
pkgdesc="Yet another helm for listing the files in a git repo"
url="https://github.com/emacs-helm/helm-ls-git"
arch=('any')
license=('GPL3')
depends=('emacs-helm')
makedepends=('emacs' 'git')
source=("https://github.com/emacs-helm/helm-ls-git/archive/v${pkgver}.tar.gz")
sha256sums=('76ee2b08d5ab95dd9fdd84aa7e57ac1c1e9f0996ffe25f6acb7cde502583d59f')

build() {
  cd "${srcdir}/helm-ls-git-${pkgver}"
  emacs -q -batch -f batch-byte-compile helm-ls-git.el
}

package() {
  cd "${srcdir}/helm-ls-git-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/helm-ls-git"
  install -m644 helm* "${pkgdir}/usr/share/emacs/site-lisp/helm-ls-git/"
}
